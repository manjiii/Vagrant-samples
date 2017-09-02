'use strict';

global.app_require = function(name) {
    return require(__dirname + '/' + name);
}
const express = require('express');
const app = express();
var routes = app_require('routes/router');
var logger = app_require('modules/logger');
var ejs = require('ejs');
app.engine('ejs', ejs.renderFile);
app.set('view engine', 'ejs');

var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

app.use('/', routes);
 
app.use(function(req, res, next) {
  logger.error('error:'  + req);
	var err = new Error('Not Found');
	err.status = 404;
	next(err);
});
 
app.use(function(err, req, res, next) {
    logger.error('error:'  + err);
		res.status(err.status || 500);
		res.render('error', {
		message: err.message,
		error: err
	});
});

app.listen(PORT, HOST);
logger.info(`Running on http://${HOST}:${PORT}`);
