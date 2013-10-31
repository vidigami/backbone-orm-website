var Task = Backbone.Model.extend({
  urlRoot: '/tasks'
});
Task.prototype.sync = require('backbone-http').sync(Task);
