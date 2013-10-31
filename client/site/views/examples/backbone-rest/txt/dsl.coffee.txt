new RestController(app, {
  model_type: Task
  route: '/tasks'
  templates:
    show: {$select: ['id', 'name']}
    show_with_stuff: {$select: ['id', 'name', 'stuff']}
  default_template: 'show'
})
