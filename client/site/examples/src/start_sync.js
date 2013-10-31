// in the browser: var MemorySync = Backbone.ORM.sync;
var MemorySync = require('backbone-orm').sync;

var Project = Backbone.Model.extend({
  urlRoot: ''
});
Project.prototype.sync = MemorySync(Project);
