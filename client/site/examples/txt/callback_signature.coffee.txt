# Node style
project.save (err, project) ->
  return console.log 'Oh no an error' if err
  console.log "We're saved!"

# Backbone style
project.save {
  success: (project) ->
    console.log "We're saved!"
  error: (project, err) ->
    console.log 'Oh no an error'
}
