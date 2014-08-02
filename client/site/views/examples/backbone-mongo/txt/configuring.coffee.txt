# configure replicaset globally
require('backbone-mongo').configure {connection_options: {
  retryMiliSeconds: 1000
  numberOfRetries: 2*60
  autoReconnect: true
}}

# set journalling for a specific model
class Task extends Backbone.Model
  urlRoot: 'mongodb://localhost:27017/tasks?journal=true'
  sync: require('backbone-mongo').sync(Task)
