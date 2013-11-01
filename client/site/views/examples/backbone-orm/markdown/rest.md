### BackboneHTTP and BackboneRest

BackboneHTTP provides an interface for consuming JSON APIs through HTTP. BackboneRest provides a RESTful controller for JSON APIs from Node.js. Together, they rock!

With this simple example setup, you can iterate through Tasks on the server or in the browser and can even make ad-hoc queries from the Brower's address bar:

Assuming you Node.js app in on port 5000, you can request tasks by name:

```
localhost:5000/tasks?name='Bob'
```

or even ask for the first 10 names of names of tasks:

```
localhost:5000/tasks?$sort=name&$values=name&$limit=10
```
