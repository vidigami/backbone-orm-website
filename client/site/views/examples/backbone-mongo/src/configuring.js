// configure replicaset globally
_.extend(require('backbone-mongo').connection_options, {
  retryMiliSeconds: 1000,
  numberOfRetries: 2 * 60,
  autoReconnect: true,
  readPreference: require('mongodb').ReadPreference.NEAREST
});

// set journalling for a specific model
var Task = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/tasks?journal=true',
});
Task.prototype.sync = require('backbone-mongo').sync(Task);
