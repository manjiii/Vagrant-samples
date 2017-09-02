var log4js = require('log4js');
var log_dir = process.env.npm_config_log_dir;
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