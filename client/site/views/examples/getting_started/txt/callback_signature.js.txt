// Node style
project.save(function(err, project) {
  if (err) {
    return console.log('Oh no an error');
  }
  return console.log("We're saved!");
});

// Backbone style
project.save({
  success: function(project) {
    return console.log("We're saved!");
  },
  error: function(project, err) {
    return console.log('Oh no an error');
  }
});
