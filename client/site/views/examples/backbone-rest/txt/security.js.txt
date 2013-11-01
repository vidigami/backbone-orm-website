var ensureLoggedIn = require('connect-ensure-login');

var customAuthorization = function(req, res, next) {
  if (!req.user.canAccessTask(req)) {
    return res.status(401).send('you cannot access this task');
  }
  return next();
};

new RestController(app, {
  auth: [ensureLoggedIn('/login'), customAuthorization],
  model_type: Task,
  route: '/tasks'
});
