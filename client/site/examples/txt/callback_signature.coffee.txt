# Node style
model.save (err, model) ->
  return console.log 'Oh no an error' if err
  console.log "We're saved!"

# Backbone style
model.save {
  success: (model) ->
    console.log "We're saved!"
  error: (model, err) ->
    console.log 'Oh no an error'
}
