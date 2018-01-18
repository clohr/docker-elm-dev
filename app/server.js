#!/usr/bin/env node

const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const errorHandler = require('errorhandler');
const methodOverride = require('method-override');

const hostname = process.env.HOSTNAME || 'localhost';
const port = parseInt(process.env.PORT, 10) || 8000;
const publicDir = process.argv[2] || __dirname + '/public';
const path = require('path');

app.get('/', function (req, res) {
  res.sendFile(path.join(publicDir, '/index.html'));
});

app.use(methodOverride());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(express.static(publicDir));
app.use(errorHandler({
  dumpExceptions: true,
  showStack: true
}));

console.log('Simple static server showing %s listening at http://%s:%s', publicDir, hostname, port);
app.listen(port, hostname);