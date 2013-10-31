var MongoSync = require('backbone-mongo').Sync;

// manual_fetch: Tasks will not be loaded when accessing a projects tasks property
var Project = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/projects',
  schema: {
    tasks: function() { return ['hasMany', Task, {manual_fetch: true}]; }
  }
});
Project.prototype.sync = MongoSync(Project);

// virtual: Tasks will not have their foreign keys updated automatically if a project is deleted
//          or it has its tasks changed while some are not loaded to memory
var Project = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/projects',
  schema: {
    tasks: function() { return ['hasMany', Task, {virtual: true}]; }
  }
});

// embed: Tasks will be saved as an embedded document in each project
var Project = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/projects',
  schema: {
    tasks: function() { return ['hasMany', Task, {embed: true}]; }
  }
});
