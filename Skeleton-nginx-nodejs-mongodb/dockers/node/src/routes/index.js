exports.index = function (req, res) {

    res.render('index',
        {
            title: 'Hello Node & express & ejs !'
        });
};