_ = require 'underscore'
fs = require 'fs'

BUILD_TASKS = ['copy', 'concat', 'coffee', 'stylus', 'jade']
RELEASE_TASKS = BUILD_TASKS.concat(['uglify:site', 'cssmin:site'])

module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      assets: ['public/']

    copy:
      vendor_assets: {files: [{expand: true, cwd: 'client/vendor/assets', src: '**', dest: 'public'}]}
      site_assets: {files: [{expand: true, cwd: 'client/site/assets', src: '**', dest: 'public'}]}
      txt: {files: [{
        expand: true,
        cwd: 'client/site/examples/src/',
        src: '*',
        filter: 'isFile',
        dest: 'client/site/examples/txt',
        rename: (dest, src) -> "#{dest}/#{src}.txt"
      }]}

    coffee:
      site: {expand: true, cwd: 'client/site/scripts', src: '**/*.coffee', dest: 'public/js', ext: '.js'}
      examples: {expand: true, cwd: 'client/site/examples/src', src: '**/*.coffee', dest: 'client/site/examples/src/_compiled', ext: '.js'}

    jade:
      site:
        options:
          client: false
          pretty: true
          analytics_id: ''
          fs: fs
          src_path: 'client/site/examples/src/'
        files: {'public/': ['client/site/views/**/*.jade']}

    stylus:
      site: {files: {'public/css/site.css': ['client/site/styles/*.styl']}}

    concat:
      vendor_styles: {src: 'client/vendor/styles/**/*', dest: 'public/css/vendor.css'}
      vendor_scripts: {src: 'client/vendor/scripts/**/*', dest: 'public/js/vendor.js'}

    uglify:
      site: {expand: true, cwd: 'public/js/', src: ['*.js', '!*.min.js', '!*-min.js'], dest: 'public/js/', ext: '.js'}

    cssmin:
      site: {expand: true, cwd: 'public/css/', src: ['*.css', '!*.min.css', '!*-min.css'], dest: 'public/css/', ext: '.css'}

    watch:
      app:
        files: ['client/**/*']
        tasks: BUILD_TASKS

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['clean'].concat(BUILD_TASKS).concat(['watch'])
  grunt.registerTask 'release', ['clean'].concat(RELEASE_TASKS)
