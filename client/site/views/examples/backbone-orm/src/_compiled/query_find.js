(function() {
  Project.findOne({
    id: 123
  }, function(err, project) {});

  Project.findOne({
    name: 'my kickass project'
  }, function(err, project) {});

  Project.find({
    is_active: true
  }, function(err, projects) {});

  Project.find({
    id: {
      $in: [1, 2, 3]
    }
  }, function(err, projects) {});

  Project.find({
    $ids: [1, 2, 3]
  }, function(err, projects) {});

}).call(this);
