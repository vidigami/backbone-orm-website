// Find the Project with id = 123
Project.findOne({id: 123}, function(err, project) { /* ... */ });

// Find the first Project named 'my kickass project'
Project.findOne({name: 'my kickass project'}, function(err, project) { /* ... */ });

// Find all items with is_active = true
Project.find({is_active: true}, function(err, projects) { /* ... */ });

// Find the items with an id of 1, 2 or 3
Project.find({id: {$in: [1, 2, 3]}}, function(err, projects) { /* ... */ });

// A shortcut for `$in` when we're working with ids
Project.find({$ids: [1, 2, 3]}, function(err, projects) { /* ... */ });
