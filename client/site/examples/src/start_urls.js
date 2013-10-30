Project = Backbone.Model.extend({
  urlRoot: 'mongodb://localhost:27017/projects'
});
Project.prototype.sync = MongoSync(Project);
