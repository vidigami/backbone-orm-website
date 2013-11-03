### First step: Install Express and BackboneORM

We're going to create a simple Node app with BackboneORM and Express to store and retrieve some data from a MongoDB.

Lets start out with a simple directory structure. Make a new one for the app (we're calling it `app` here) and add a
`client` and a `server` directory to it, so it looks like so:

    * - app
    *  - client
    *  - server

Next up we need to install Express and BackboneORM. Make sure your're in the `app` directory jsut created and run the
following:

    npm install express --save
    npm install backbone-mongo --save
    npm install backbone-rest --save

Note that we don't need to install BackboneORM directly, as it's a dependency of the others. We use the `--save` option
to tell npm to write our dependencies to package.json so we don't need to add them manually.
