var ensureLoggedIn = require('connect-ensure-login');

new RestController(app, {
  auth: ensureLoggedIn('/login'),
  model_type: Task,
  route: '/tasks'
});
