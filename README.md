# README

To use this repo:
# test
1. Fork your own copy of this repo and clone it. Change directories in your terminal to the project name. 
2. Run `bundle install` in your terminal. (Note: Ruby and is a dependency. Make sure you have version 3.2.0 installed)
3. Run `rails db:create` in your terminal to create your development and test database. 
4. Run `rails db:migrate` to construct your database schema. 
5. Run `rails db:seed` to seed your database with records 
(Note: this may take a while. If it is taking too long then consider editing the seeds file to create fewer records)
6. Run `rspec spec` to see test results. 

# Overview

This repository is intended to demonstrate G2's query builder / visitor pattern ("builder pattern"). This builder 
pattern sits atop ActiveRecord as a higher level abstraction that incorporates domain specific logic. With the builder 
pattern it is possible to gracefully construct composable queries that deal well with conditional branches and are 
highly modular, and thus able to deal gracefully with extensions or modifications in response to new features or 
changes to business logic. The remainder of this readme serves as an explanation of the builder pattern and how to use
it. 

## Background and Database Schema

We have deliberately left out a frontend to this as the builder pattern is implementation agnostic: it can serve any
frontend that can make calls to a Rails backend. G2 uses graphql with this pattern but this is not required.

We have left our demonstration schema relatively simple (but not too simple!) to make our queries easier to understand.
The details are not very important; it is sufficient to know that this follows a 'star schema' pattern with characters
as the center table connecting to a number of associated tables, including feats, flaws, spells, specializations,
campaigns, and virtues, to name a few. This resembles a character management system for classic tabletop role playing
games.

Many software engineers love RPGs and will appreciate the schema, but if it seems unfamiliar to you then fear not!
Our schema is for demonstration purposes only and it is not necessary to understand the nuances of RPGs to grasp 
the builder pattern this repo demonstrates. 

## Query classes

The best way to learn the builder pattern is to play with specific examples. Find `Queries::Characters::IndexQuery` 
and read it over. The specs are also a good source of documentation. 
Run `rspec spec/queries/characters/index_query_spec.rb` in your terminal to see the test output. 

The naming of the class gives us a hint at its purpose: it runs a query that returns a list of characters (specifically,
an ActiveRecord Relation). The specific characters returned will depend on the filters passed in. 

Our class inherits some of its behavior from its base class `Queries::Base`. The builder pattern is object oriented
and follows all of the usual principles of good OOP design. It uses inheritance in accordance with the Liskov principle:
all query classes follow the same basic interface where their public method is #call, which returns the results of our
query. The implementation details of the #call method are left up to the descendent class, but all of them add nodes to
their builder and delegate the building of the query to the builder. 

The builder is injected as a dependency into the query class, and uses `QueryBuilder::Builders::Default` by default. 
This default can be overriden with a different builder that uses its own algorithm, and this is thus one of the many 
places our query classes maintain their composability. More on the builder later. 

The query class takes another input, filters. These can be strongly typed but that is an implementation detail. At 
its core the filters are just a nested hash that give the conditions the user has demanded of our query. Some classes 
take other inputs, including order and limit parameters commonly. But the builder and filters are the most important
inputs for the builder pattern. 

We can see in `Queries::Characters::IndexQuery` that we are adding nodes to the builder and that this builder will 
perform some operation on them. But how does `IndexQuery` know what nodes to add in response to the filters it is given?
Where is the conditional logic in this class? IndexQuery does not know what nodes to add and does not have any 
conditional branching in it. Those tasks are delegated elsewhere, and that is the beauty of it!

The query classes can be thought of as providing the "raw material" of the query. They pass all of the nodes that the
builder *might* need to construct the query. Unnecessary nodes will be eliminated when the builder visits each node with
its accumulated state, and the node will decide if is to be included based on its state and the filters passed to it.

Our query class is thus left free to tell a story in the nodes it contains. It is also open to easy extension: if our
query needs another conditional branch or a join to another table then we can simply add the new node(s) needed, 
confident that the nodes and builder will handle the logic. Wrapping our various logic and clauses in Node classes also 
makes our code easily maintainable: do not underestimate the advantage of searchability of named classes in an editor 
and the ease of modifying a node if a hotfix or a change in business logic warrants it. 

## Builders 

We next turn our attention to the builders. Find `QueryBuilder::Builders::Default` and read over this class. Its 
public interface is inherited from `QueryBuilder::Builders::Base`. The builder stores two crucial pieces of state: 
the `initial_state` and the `nodes`. Our initial_state is the head of our ActiveRecord query and is passed in from 
the query class. And `nodes` is an array of typed nodes where the type is specified in `base_node_class`. Our builder
starts with the `nodes` array empty and has nodes added to it through the `#add` method.

The query class will call `#build` on the builder once it has added all of the nodes. And the build method is where 
things really get interesting. Our central algorithm is revealed: the builder uses `reduce`. And it does so in unique
fashion: in addition to accumulating state it eliminates invalid nodes and extracts clauses by `visiting` each node. 
The logic is thus mostly delegated to nodes: each node decides if it is valid based on its own logic and the state it 
receives; the node also decides what to do with the state (accumulated ActiveRecord query) it receives. The `builder
pattern` is thus also a `visitor pattern` in that a builder visits its nodes. 

## Nodes

The term `nodes` will be familiar to most programmers. At its most simple a node is simply a data structure that is part
of a larger link or tree structure (as in an abstract syntax tree or a query). That is also true of nodes in the builder
pattern with the crucial distinction that they can also encapsulate higher domain logic and abstractions. Nodes in the 
builder pattern are thus not data primitives; they are named classes that hold state, can contain logic, and either 
resolve to an ActiveRecord clause or contain other nodes. 

We can start with a simpler example, `QueryBuilder::Campaigns::Nodes::TitleIn`. The naming of this class describes its
purpose: it concerns the `campaigns` table, and the `TitleIn` class name makes us think of a `where title in _` clause. 
It takes one parameter when initialized: `titles`. These `titles` may or may not be present in filters, and thus this 
node exposes a `#valid?` method that checks if titles are present. Its other public method is more subtle. When a
builder "visits" a node it typically checks if it is valid and calls `#accept` on the node, passing it accumulated
state. In this particular node the `#accept` method simply merges a clause into the ActiveRecord query.
Its clause is, unsurprisingly, `Campaign.where(title: titles)`. 

This node is fairly typical of the builder pattern: it defines the conditions where it is valid, accepts a filter
param ("titles" in this case), and merges a clause when visited by the builder. 

Some nodes are not tied to a specific table but are excellent tools for use in many queries. See the common node 
`QueryBuilder::Nodes::Joins::InnerJoin` for a good example.

### Nested Nodes

Special attention should be paid to another variety of node, however, and these are the nodes that nest other nodes. Two
of these are common tools that are quite useful: `QueryBuilder::Nodes::Wheres::And` and its sibling `Or` class in the
same module. These nodes can nest nodes that resolve to clauses contained in `where and` or `where or` clauses, 
respectively.

One of the great advantages of nested nodes is the ability to group higher level domain specific logic that are often 
key elements of our business. And the `QueryBuilder::Characters::Nodes::Legendary` node is a perfect illustration of
this. Its story is that our (hypothetical) product manager knows that our clients highly value being able to search for
characters of "legendary status". These characters have reached a certain threshold of experience and progression in one
of their key stats. 

The `Legendary` node gracefully handles the nested `where` clauses this requires, which include both `or` and `and` 
operators. 

As a consequence our domain logic for legendary characters is:
1. well documented in our codebase 
2. easily searchable
3. reusabled in other queries
4. maintainable: it can be modified, if necessary, and ensure that all queries using it follow the same domain logic.

The last point is one of the main necessities that inspired our builder pattern invention: in the past we found that
working with lower level abstractions, such as SQL or vanilla ActiveRecord, often led to painful regressions as it
was quite difficult to find where common logic was used in different queries.

## Putting it all together

The builder pattern thus uses 3 main objects: queries, builders, and nodes. Queries are the public interface with the
rest of our app that desires output for a query. Queries accept filters and encapsulate the raw material (nodes) of
our query. They add nodes to their builder.

The builder accumulates nodes and performs a reduce algorithm on its complete collection of nodes; invalid nodes that
do not meet filtering criteria are eliminated, and state is accumulated through the visiting of nodes.

Nodes determine if they are valid given filter params and state passed to them; a valid node produces a clause merged
to the ActiveRecord query or calls on nested nodes to produce clauses. Nodes can thus be nested ad infinitum if needed.

Together these domain objects give us a builder pattern that can compose queries of any needed complexity while keeping
our code clean, dry, and maintainable. The examples in this repo are relatively simple for learning purposes. We at G2
have built much more complex queries and have found that this pattern has stood the test of time.

We hope you enjoy this repo and find the inspiration to make this builder pattern your own.

With kind regards,

Justin Daniel and the G2 engineering team
