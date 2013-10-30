// Node style
model.save(function(err, model) {
  if (err) {
    return console.log('Oh no an error');
  }
  return console.log("We're saved!");
});

// Backbone style
model.save({
  success: function(model) {
    return console.log("We're saved!");
  },
  error: function(model, err) {
    return console.log('Oh no an error');
  }
});
