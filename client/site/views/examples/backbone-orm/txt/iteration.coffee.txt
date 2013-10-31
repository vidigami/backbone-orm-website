# Iterate through all items with is_active = true in batches of 200
Project.each {is_active: true, $each: {fetch: 200}},
  ((project, callback) -> console.log "project: #{project.get('name')}"; callback()),
  (err) -> console.log 'Done'

# Stream all items with is_active = true in batches of 200
Project.stream({is_active: true, $each: {fetch: 200}})
  .pipe(new ModelStringifier())
  .on('finish', -> console.log 'Done')

# Collect the status of tasks over days
stats = []
Task.interval {$interval: {key: 'created_at', type: 'days', length: 1}},
  ((query, info, callback) ->
    histogram = new Histogram()
    Task.stream(_.extend(query, {$select: ['created_at', 'status']}))
      .pipe(histogram)
      .on('finish', -> stats.push(histogram.summary()); callback())
  ),
  (err) -> console.log 'Done'
