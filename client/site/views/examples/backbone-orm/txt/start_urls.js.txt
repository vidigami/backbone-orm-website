var Project = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/projects'
});
Project.prototype.sync = require('backbone-mongo').sync(Project);