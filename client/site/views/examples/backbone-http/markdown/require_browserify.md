#### Load Using Browserify

You can browserify BackboneHTTP and include the full package into the browser:

```
npm install backbone-http
```

```
browserify -r backbone-http > backbone-http-bundle.js
```

Because browserify by default will pull in the stream interface, you can use the stream interface on the client.
