
var logger = app_require('modules/logger');
var COL = 'manjiii_clctn';

const url = require('url');
var MongoClient = require("mongodb").MongoClient;
var mongoUrl = 'mongodb://mongodb:27017/manjiii_db';
var title = 'mongo db';

exports.index = (req, res) => {

    MongoClient.connect(mongoUrl, (error, db) => {

        findDocuments(db, function (users) {
            res.render('mongo', { title: title, message: res.locals.message, users: users });
            db.close();
        })
    });
};

var findDocuments = function (db, callback) {
    var collection = db.collection(COL);
    collection.find().toArray(function (err, docs) {
        callback(docs);
    });
}

