class Change extends Backbone.Model
  model_name: 'Change'
  sync: require('backbone-orm').sync(Change)

class Task extends Backbone.Model
  urlRoot: 'mongodb://localhost:27017/tasks'
  schema:
    project: -> ['belongsTo', Project]
    changes: -> ['hasMany', Change, embed: true]
  sync: require('backbone-mongo').sync(Task)

class Project extends Backbone.Model
  urlRoot: 'mongodb://localhost:27017/projects'
  schema:
    tasks: -> ['hasMany', Task]
    changes: -> ['hasMany', Change, embed: true]
  sync: require('backbone-mongo').sync(Project)
