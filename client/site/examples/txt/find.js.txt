// Unified query syntax
Model.find({name: 'Foo'}, function(err, model) {
  console.log("Hello, " + (model.get('name')));
});
