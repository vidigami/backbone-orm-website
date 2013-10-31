class Project extends Backbone.Model
  urlRoot: '/projects'
  sync: require('backbone-http').sync(Project)

# Find all items with is_active = true
Project.find {is_active: true}, (err, projects) ->

# Iterate through all items with is_active = true in batches of 200
Project.each {is_active: true, $each: {fetch: 200}},
  ((project, callback) -> console.log "project: #{project.get('name')}"; callback()),
  (err) -> console.log 'Done'

# Stream all items with is_active = true in batches of 200
Project.stream({is_active: true, $each: {fetch: 200}})
  .pipe(new ModelStringifier())
  .on('finish', -> console.log 'Done')
