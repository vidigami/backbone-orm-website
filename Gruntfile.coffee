util = require 'util'
_ = require 'underscore'

module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      assets: ['public/']

    copy:
      vendor_assets: {files: [{expand: true, cwd: 'client/vendor/assets', src: '**', dest: 'public'}]}
      site_assets: {files: [{expand: true, cwd: 'client/site/assets', src: '**', dest: 'public'}]}

    coffee:
      site: {expand: true, cwd: 'client/site/scripts', src: '**/*.coffee', dest: 'public/js', ext: '.js'}
      examples: {expand: true, cwd: 'client/site/examples/src', src: '**/*.coffee', dest: 'client/site/examples/src/_compiled', ext: '.js'}

    jade:
      site_views:
        options:
          client: false
          pretty: true
          analytics_id: ''
        files: {'public/': ['client/site/views/**/*.jade']}

    stylus:
      site_styles: {files: {'public/css/site.css': ['client/site/styles/*.styl']}}

    concat:
      vendor_styles: {src: 'client/vendor/styles/**/*', dest: 'public/css/vendor.css'}
      vendor_scripts: {src: 'client/vendor/scripts/**/*', dest: 'public/js/vendor.js'}

    watch:
      app:
        files: ['client/**/*']
        tasks: ['copy', 'concat', 'coffee', 'stylus', 'jade']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['copy', 'concat', 'coffee', 'stylus', 'jade']
