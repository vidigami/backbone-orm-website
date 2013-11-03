# Models fetched with custom rendering including relationships
Project.find {$template: 'project_with_tasks'}, (err, custom_projects_with_tasks) ->

# Models including all relationship models
Project.find {$include: 'tasks'}, (err, projects_with_tasks) ->

# Models rendered including relationships as JSON
Project.cursor().include('tasks').toJSON (err, projects_with_tasks_json) ->
