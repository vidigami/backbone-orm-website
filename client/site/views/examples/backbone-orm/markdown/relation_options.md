### Relation options

Sometimes we'll want to treat certain relations differently, the following options are available:

* `manual_fetch`: By default BackbonORM will load related models whenever they are accessed. To turn off this behavior
  and manually retrieve related models, pass `manual_fetch: true` as an option to the relation.
* `virtual`: By default, BackbonORM will ensure that changes to relations in memory are persisted to the respective store.
  This may result in `hasOne`, `hasMany` and `manyToMany` relations being loaded in order to update their foreign keys.
  To turn off this behavior and manually manage model relations, pass `virtual: true` as an option to the relation.
  This is particularly useful when you wish to use models that do not have a store representation (e.g. they may be on
  the client).
* `embed`: By default, relations are given their own storage representation (collection/table/endpoint). To indicate that
  a model should only be saved as embedded json in a parent model pass `embed: true` as an option to the relation.

