module.exports =
  # select id and name from the task
  {$select: ['id', 'name']}

  # use a render function
  task_custom:   (model, options, callback) ->
    callback(null, _.pick(model.attributes, 'id', 'name'))

  # select properties from relationship
  project:          {$select: ['id', 'name']}

  # relationship inferred with query
  commits:          {query: {active: false}}

  # relationship with operation
  total_commits:    {key: 'commits', query: {$count: true}}
