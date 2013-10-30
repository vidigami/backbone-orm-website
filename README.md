Introduction
============

The Vidigami corporate website project. It uses Jade and Stylus to generate a static website.

Application Architecture
=======

client - source assets
------

- app: the Vidigami corporate website application
    - scripts: javascript files
    - styles: [stylus](http://learnboost.github.io/stylus/) files that get compiled to css
    - views: [jade](http://jade-lang.com/) files that get compiles to html
- vendor: 3rd party libraries that are used by the Vidigami corporate website
    - assets: non-script and non-css files (they don't get minified)
        - fonts
        - images
    - scripts: 3rd party javascript files. They all are concatenated into vendor.js
    - styles: 3rd party css files. They all are concatenated into vendor.css

public - compiled assets
------

- css
    - app.css
    - vendor.css
- fonts
- images
- js
    - app.js
    - vendor.js
- *.html


Install
=======

1. Install Node.js: http://nodejs.org/

2. run npm install in the root directory:

$ npm install

3. Install global node modules

$ sudo npm install grunt-cli -g

Build and Watch
=======

To compile assets and watch for changes, run:

$ grunt


Release
=======

To compile minified assets for release, run:

$ grunt release
