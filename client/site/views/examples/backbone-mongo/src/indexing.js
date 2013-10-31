var Task = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/tasks',
  schema: {
    id: [indexed: true]
  }
});
Task.prototype.sync = require('backbone-mongo').sync(Task);
