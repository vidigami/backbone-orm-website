### Getting Started

BackboneORM lets you use basic backbone models. To make them all ORM-y, give them a BackboneORM `sync` method with
 their model type.

BackbonemonORM will patch the provided model through the Sync constructor. Here we're just using the MemorySync for in-memory
models, so we don't need to specify an `url`.
