### Migrations

Database helpers are provided via the `DatabaseTools` class to get models up and running with ease.

Use `ModelType.db().ensureSchema(callback)` to non-destructively sync models with their database tables.
