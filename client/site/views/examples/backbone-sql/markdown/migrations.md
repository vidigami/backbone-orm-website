### Migrations

Database helpers are provided via the `DatabaseTools` class to get models up and running with ease.

Use `ModelType.db().ensureSchema(done)` to non-destructively sync models with their database tables.
