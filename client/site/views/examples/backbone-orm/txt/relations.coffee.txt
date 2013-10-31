MongoSync = require('backbone-mongo').sync

class Project extends Backbone.Model
  urlRoot: "mongodb://localhost:27017/projects"
  schema:
    tasks: -> ['hasMany', Task]
  sync: MongoSync(Project)

class Task extends Backbone.Model
  urlRoot: "mongodb://localhost:27017/tasks"
  schema:
    project: -> ['belongsTo', Project]
  sync: MongoSync(Task)

# Asynchronous relation loading
Project.findOne {name: 'My project'}, (err, project) ->
  # Retrieve its tasks from mongo
  project.get 'tasks', (err, tasks) ->
    # Do things with tasks

# Find a project and its tasks with `$include`
Project.findOne {name: 'My project', $include: 'tasks'}, (err, project) ->
  # Tasks are already loaded, we can just use them
  tasks = project.get('tasks')
