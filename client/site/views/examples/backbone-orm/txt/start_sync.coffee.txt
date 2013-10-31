# in the browser: MemorySync = Backbone.ORM.sync
MemorySync = require('backbone-orm').sync

class Project extends Backbone.Model
  urlRoot: '/projects'
  sync: MemorySync(Project)
