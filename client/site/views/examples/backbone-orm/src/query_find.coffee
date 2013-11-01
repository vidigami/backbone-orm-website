# Find the Project with id = 123
Project.findOne {id: 123}, (err, project) ->

# Find the first Project named 'my kickass project'
Project.findOne {name: 'my kickass project'}, (err, project) ->

# Find all items with is_active = true
Project.find {is_active: true}, (err, projects) ->

# Find the items with an id of 1, 2 or 3
Project.find {id: {$in: [1, 2, 3]}}, (err, projects) ->

# A shortcut for `$in` when we're working with ids
Project.find {$ids: [1, 2, 3]}, (err, projects) ->

# Find active items in pages
Project.find {is_active: true, $limit: 10, $offset: 20}, (err, projects) ->

# Select named properties from each model
Project.find {$select: ['created_at', 'name']}, (err, array_of_json) ->

# Select values in the specified order
Project.find {$values: ['created_at', 'status']}, (err, array_of_arrays) ->

# Find active items in pages using cursor syntax (Models or JSON)
Project.cusror({is_active: true}).limit(10).offset(20).toModels (err, projects) ->
Project.cusror({is_active: true}).limit(10).offset(20).toJSON (err, projects_json) ->

# Find completed tasks in a project
project.cusror('tasks', {status: 'completed'}).sort('name').toModels (err, tasks) ->
