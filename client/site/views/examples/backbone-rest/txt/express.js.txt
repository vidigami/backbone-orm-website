"use strict";

var app = require('express')();
app.use(require('body-parser').json({}));
app.listen(3000);

class Project extends require('backbone').Model {
  constructor(options) {
    super(options);
    this.urlRoot = '/projects';
  }
}
Project.sync = require('backbone-orm').sync(Project);

var RESTController = require('backbone-rest');
new RESTController(app, {model_type: Project, route: '/projects'});
