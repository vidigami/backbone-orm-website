var Task = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/tasks'
});
Task.prototype.sync = require('backbone-mongo').sync(Task);

new RestController(app, {model_type: Task, route: '/tasks'});
