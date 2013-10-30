var Project = Backbone.Model.extend({
  urlRoot: ''
});
Project.prototype.sync = MemorySync(Project);
