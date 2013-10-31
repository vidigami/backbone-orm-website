// Iterate through all items with is_active = true in batches of 200
Project.each({is_active: true, $each: {fetch: 200}},
  function(project, callback) {console.log('project: ' + project.get('name')); callback()},
  function(err) {return console.log('Done');}
);

// Stream all items with is_active = true in batches of 200
Project.stream({is_active: true, $each: {fetch: 200}})
  .pipe(new ModelStringifier())
  .on('finish', function() {return console.log('Done');});

var stats = [];
Task.interval({$interval: {key: 'created_at', type: 'days', length: 1}},
  function(query, info, callback) {
    var histogram = new Histogram()
    Task.stream(_.extend(query, {$select: ['created_at', 'status']}))
      .pipe(histogram)
      .on('finish', function() {stats.push(histogram.summary()); return callback();});
  },
  function(err) { return console.log('Done'); }
);
