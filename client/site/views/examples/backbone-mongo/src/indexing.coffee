class Task extends Backbone.Model
  urlRoot: 'mongodb://localhost:27017/tasks?journal=true'
  schema:
    id: [indexed: true]
  sync: require('backbone-mongo').sync(Task)
