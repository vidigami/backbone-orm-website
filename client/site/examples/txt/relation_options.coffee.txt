MongoSync = require('backbone-mongo').Sync

# manual_fetch: Tasks will not be loaded when accessing a projects tasks property
class Project extends Backbone.Model
  urlRoot: "mongodb://localhost:27017/projects"
  @schema:
    tasks: -> ['hasMany', Task, manual_fetch: true]
  sync: MongoSync(Project)

# virtual: Tasks will not have their foreign keys updated automatically if a project is deleted
#          or it has its tasks changed while some are not loaded to memory
class Project extends Backbone.Model
  urlRoot: "mongodb://localhost:27017/projects"
  @schema:
    tasks: -> ['hasMany', Task, virtual: true]
  sync: MongoSync(Project)

# embed: Tasks will be saved as an embedded document in each project
class Project extends Backbone.Model
  urlRoot: "mongodb://localhost:27017/projects"
  @schema:
    tasks: -> ['hasMany', Task, embed: true]
  sync: MongoSync(Project)
