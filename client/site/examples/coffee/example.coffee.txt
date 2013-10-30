# Unified query syntax
Model.find {name: 'Foo'}, (err, model) =>
  console.log "Hello, #{model.get('name')}"
