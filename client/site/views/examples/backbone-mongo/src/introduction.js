var Change = Backbone.Model.extend({
  model_name: 'Change',
});
Change.prototype.sync = require('backbone-orm').sync(Change);

var Task = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/tasks',
  schema: {
    project: function() { return ['belongsTo', Project]; }
    changes: function() { return ['hasMany', Change, {embed: true}]; }
  }
});
Task.prototype.sync = require('backbone-mongo').sync(Task);

var Project = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/projects',
  schema: {
    tasks: function() { return ['hasMany', Task]; }
    changes: function() { return ['hasMany', Change, {embed: true}]; }
  }
});
Project.prototype.sync = require('backbone-mongo').sync(Project);

