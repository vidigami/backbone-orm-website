class Task extends Backbone.Model
  urlRoot: '/tasks'
  sync: require('backbone-http').sync(Task)
