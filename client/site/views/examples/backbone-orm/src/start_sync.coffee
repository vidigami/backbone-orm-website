class Project extends Backbone.Model
  urlRoot: '/projects'
  sync: require('backbone-orm').sync(Project)
