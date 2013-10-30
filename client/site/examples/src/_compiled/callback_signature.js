(function() {
  model.save(function(err, model) {
    if (err) {
      return console.log('Oh no an error');
    }
    return console.log("We're saved!");
  });

  model.save({
    success: function(model) {
      return console.log("We're saved!");
    },
    error: function(model, err) {
      return console.log('Oh no an error');
    }
  });

}).call(this);
