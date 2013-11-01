// Find the Project with id = 123
Project.findOne({id: 123}, function(err, project) {});

// Find the first Project named 'my kickass project'
Project.findOne({name: 'my kickass project'}, function(err, project) {});

// Find all items with is_active = true
Project.find({is_active: true}, function(err, projects) {});

// Find the items with an id of 1, 2 or 3
Project.find({id: {$in: [1, 2, 3]}}, function(err, projects) {});

// A shortcut for `$in` when we're working with ids
Project.find({$ids: [1, 2, 3]}, function(err, projects) {});

// Find all items with is_active = true
Project.find({is_active: true, $limit: 10, $offset: 20}, function(err, projects) {});

// Select named properties from each model
Project.find({$select: ['created_at', 'name']}, function(err, array_of_json) {});

// Select values in the specified order
Project.find({$values: ['created_at', 'status']}, function(err, array_of_arrays) {});

// Find active items in pages using cursor syntax (Models or JSON)
Project.cursor({is_active: true}).limit(10).offset(20).toModels function(err, projects) {});
Project.cursor({is_active: true}).limit(10).offset(20).toJSON function(err, projects_json) {});

// Find completed tasks in a project sorted by name
project.cursor('tasks', {status: 'completed'}).sort('name').toModels function(err, tasks) {});
