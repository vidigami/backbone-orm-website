(function() {
  var Task, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Task = (function(_super) {
    __extends(Task, _super);

    function Task() {
      _ref = Task.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Task.prototype.url = '/tasks';

    Task.prototype.sync = require('backbone-sql').sync(Task);

    return Task;

  })(Backbone.Model);

  new RestController(app, {
    model_type: Task,
    route: '/tasks'
  });

}).call(this);