class Project extends Backbone.Model

  # Database connection and table name are specified with the urlRoot
  urlRoot: 'postgres://username:password@localhost:27017/projects'

  # Schema defines the fields for the model's table
  schema:
    created_at: 'DateTime'
    type: ['Integer', nullable: false]
    name: ['String', unique: true, indexed: true]

  # Kick it off by setting the model's sync to an SQLSync
  sync: require('backbone-sql').sync(Project)
