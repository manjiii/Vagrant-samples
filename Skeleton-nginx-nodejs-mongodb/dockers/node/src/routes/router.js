var express = require('express');
var router = express.Router();
var logger = app_require('modules/logger');

// routers
var index = app_require('routes/index');
var mongo = app_require('routes/mongo');

router.use(function (req, res, next) {
  logger.debug('request url:', req.originalUrl +  " method:" +req.method);
  next();
});
// routings
router.get('/', index.index);
router.get('/mongo', mongo.index);

module.exports = router;