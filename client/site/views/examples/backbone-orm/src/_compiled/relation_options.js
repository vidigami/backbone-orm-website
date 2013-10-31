(function() {
  var MongoSync, Project, _ref, _ref1, _ref2,
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

    Project.prototype.schema = {
      tasks: function() {
        return [
          'hasMany', Task, {
            manual_fetch: true
          }
        ];
      }
    };

    Project.prototype.sync = MongoSync(Project);

    return Project;

  })(Backbone.Model);

  Project = (function(_super) {
    __extends(Project, _super);

    function Project() {
      _ref1 = Project.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    Project.prototype.urlRoot = "mongodb://localhost:27017/projects";

    Project.prototype.schema = {
      tasks: function() {
        return [
          'hasMany', Task, {
            virtual: true
          }
        ];
      }
    };

    Project.prototype.sync = MongoSync(Project);

    return Project;

  })(Backbone.Model);

  Project = (function(_super) {
    __extends(Project, _super);

    function Project() {
      _ref2 = Project.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    Project.prototype.urlRoot = "mongodb://localhost:27017/projects";

    Project.prototype.schema = {
      tasks: function() {
        return [
          'hasMany', Task, {
            embed: true
          }
        ];
      }
    };

    Project.prototype.sync = MongoSync(Project);

    return Project;

  })(Backbone.Model);

}).call(this);
