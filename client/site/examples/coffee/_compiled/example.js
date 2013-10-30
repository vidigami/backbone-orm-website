(function() {
  var _this = this;

  Model.find({
    name: 'Foo'
  }, function(err, model) {
    return console.log("Hello, " + (model.get('name')));
  });

}).call(this);
