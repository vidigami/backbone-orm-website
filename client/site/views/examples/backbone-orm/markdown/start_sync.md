### Getting Started

BackboneORM lets you use basic backbone models. To make them all ORM-y, we override the Backbone `sync` property
with a BackboneORM Sync. We pass the Sync our model class.

BackboneORM will patch the provided model through the Sync constructor. Here we're just using the MemorySync for in-memory
models, so we don't need to specify an `urlRoot`. Usually we will, so it's here for clarity.
