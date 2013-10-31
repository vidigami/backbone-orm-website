### Persisting models

Now, in-memory models are all well and good, but that's not what we're here for. To persist our models we need to provide
a bit more information, namely filling in the `urlRoot` property.

Here we set our models `urlRoot` to a connection string specifying our mongodb database and collection.

Since we're using MongoDB here, we'll use a Sync that knows how to persist to Mongo: `MongoSync`.
