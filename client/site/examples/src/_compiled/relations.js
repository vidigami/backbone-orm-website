(function() {
  var MongoSync, Project, Task, _ref, _ref1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  MongoSync = require('backbone-mongo').Sync;

  Project = (function(_super) {
    __extends(Project, _super);

    function Project() {
      _ref = Project.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Project.prototype.urlRoot = "mongodb://localhost:27017/projects";

    Project.schema = {
      tasks: function() {
        return ['hasMany', Task];
      }
    };

    Project.prototype.sync = MongoSync(Project);

    return Project;

  })(Backbone.Model);

  Task = (function(_super) {
    __extends(Task, _super);

    function Task() {
      _ref1 = Task.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    Task.prototype.urlRoot = "mongodb://localhost:27017/tasks";

    Task.schema = {
      project: function() {
        return ['belongsTo', Project];
      }
    };

    Task.prototype.sync = MongoSync(Task);

    return Task;

  })(Backbone.Model);

  Project.findOne({
    name: 'My project'
  }, function(err, project) {
    return project.get('tasks', function(err, tasks) {
      return console.log("My task models: ", tasks);
    });
  });

  Project.findOne({
    name: 'My project',
    $include: 'tasks'
  }, function(err, project) {
    var tasks;
    tasks = project.get('tasks');
    return console.log("My task models: ", tasks);
  });

}).call(this);
