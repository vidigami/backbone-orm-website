### Relations

Backbone-ORM allows you to create relations to use with any backend

#### Relation types

Naming conventions are as follows:

* `belongsTo`: A foreign key to the related model will be placed on this model
* `hasOne`: A foreign key to this model is placed on the related model
* `hasMany`: A foreign key to this model is placed on the related model, and the relation will return a set of models when accessed
* `manyToMany`: A join table is automatically created with foreign keys to each side of the relation.

#### Asynchronous get

When using `get` on relations, if the relation has not been loaded it will be returned asynchronously via a callback.
If it is already loaded it will also be returned directly.

