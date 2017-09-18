var log4js = require('log4js');
var log_dir = process.env.NODE_LOG_DIR;
log4js.configure({
  appenders: {
    everything: { type: 'file', filename: log_dir + '/node-express.log' }
  },
  categories: {
    default: { appenders: ['everything'], level: 'debug' }
  }
});

logger = log4js.getLogger();

module.exports = logger;