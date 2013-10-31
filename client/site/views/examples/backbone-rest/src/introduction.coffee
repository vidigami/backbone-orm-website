Backbone = require 'backbone'
RestController = require 'backbone-rest'

class Task extends Backbone.Model
  urlRoot: 'mongodb://localhost:27017/tasks'
  sync: require('backbone-mongo').sync(Task)

new RestController(app, {model_type: Task, route: '/tasks'})
