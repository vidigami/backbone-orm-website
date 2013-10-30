
class Project extends Backbone.Model
  urlRoot: 'mongodb://localhost:27017/projects'
  sync: MongoSync(Project)
