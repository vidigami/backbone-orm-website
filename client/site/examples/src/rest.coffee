class Task extends Backbone.Model
  url: '/tasks'
  @schema:
    project: -> ['belongsTo', Project]
  sync: require('backbone-orm').sync(Task)

new RestController(app, {model_type: Task, route: '/tasks'})
