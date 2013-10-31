### Schema definition

Fields are specified in the models `schema` property. Each (non-relation) field corresponds to a database column.

Each field must have a type and may be provided with the additional options.

An auto-incrementing field named `id` is automatically created as the primary key for each model.

To supply options the field descriptor is passed as an array, with the first item being the field type and a settings object
as the second.

#### Available types
All types supported by [Knex](http://knexjs.org/#Schema-increments) are available. Add column specific options along
with the settings object for the field.
The first letter of the type name is optionally capitalized, while the remainder must be camelCase.

#### Common field options
These options may be applied to any field. Note that column options are currently only applied when the columns are created.

* `nullable`: Defaults to `true`. Set to false to throw an error on null values.
* `indexed`: Defaults to `false`. Set to true to create an index on the column.
* `unique`: Defaults to `false`. Set to true to create a unique constraint on the column.
