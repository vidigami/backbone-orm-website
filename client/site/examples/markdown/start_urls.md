### Persisting models

Now, in-memory models are all well and good, but that's not what we're here for. To persist your models we need to provide
a bit more information, namely filling in the `url` property (or `urlRoot` if you like).





* Give them an urlRoot (or url) that points to the database
* hasOne: A foreign key to this model is placed on the related model
* hasMany: A foreign key to this model is placed on the related model, and the relation will return a set of models when accessed
* manyToMany: A join table is automatically created with foreign keys to each side of the relation.

