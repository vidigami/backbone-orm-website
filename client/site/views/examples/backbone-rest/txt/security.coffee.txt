ensureLoggedIn = require 'connect-ensure-login'

customAuthorization = (req, res, next) ->
  unless req.user.canAccessTask(req)
    return res.status(401).send('you cannot access this task')
  next()

new RestController(app, {
  auth: [ensureLoggedIn('/login'), customAuthorization]
  model_type: Task
  route: '/tasks'
})
