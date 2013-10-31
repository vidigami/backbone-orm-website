// Using our Project model from above
db = Project.db();

// Quick and easy table creation
db.ensureSchema(function(err) {
  // The model's table will be created if it doesn't exist
  // Each field will have a corresponding column created if one does not exist
  // Join tables for manyToMany relations are created automatically
});

// Resetting a table
db.resetSchema(function(err) {
  // The model's table will be dropped and recreated
  // Related join tables will be too
});

// Create a new table
// After createTable is called we can build up a schema to be executed in one call
db.createTable()
  .addColumn('a_column', 'String', {indexed: true, length: 500})
  // Call end to execute the pending operations
  .end(function(err) {
    // Table created
  });
