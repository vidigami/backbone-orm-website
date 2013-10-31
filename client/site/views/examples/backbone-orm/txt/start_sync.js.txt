var Project = Backbone.Model.extend({
  urlRoot: '/projects'
});
Project.prototype.sync = require('backbone-orm').sync(Project);
