class Task extends Backbone.Model
  url: '/tasks'
  sync: require('backbone-sql').sync(Task)

new RestController(app, {model_type: Task, route: '/tasks'})
