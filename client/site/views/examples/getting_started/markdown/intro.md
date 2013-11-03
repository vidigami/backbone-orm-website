### What is BackboneORM?

First up, I'd like to give a decent answer to this question.

BackboneORM is a bit more than just persistence for Backbone models - it was designed to make it super easy to get a
RESTful API up and running in Node and start consuming it from the client.

The various components each have a role to play here:

  * BackboneORM is the core project. It manages relationships and does most of the fun, internal things.
  * BackboneMongo and BackboneSQL take care of persisting your models to (wait for it...) MongoDB and SQL stores.
  * BackboneREST lets you quickly generate RESTful web services from your models.
  * BackboneHTTP is a _client side_ library for accessing these services. It shares the syntax of BackboneMongo and
    BackboneSQL, but will hit up your REST endpoints rather than a database directly.

So! Without further ado, let's make an app.
