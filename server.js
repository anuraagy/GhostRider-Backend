// Load all the packages
var express     = require('express');
var bodyParser  = require('body-parser');
var morgan      = require('morgan');
var mongoose    = require('mongoose');

var jwt     = require('jsonwebtoken');
var config  = require('./config/secrets');
var routes  = require('./config/routes')

var app = express();

// Configure application
var port = process.env.PORT || 8080; //Port for creating tokens
mongoose.connect(config.database)
app.set('superSecret', config.secret)

app.use(bodyParser.urlencoded({ extended: false })); //Parse URLs
app.use(bodyParser.json());

app.use(morgan('dev')); //Logs requests

// Routes
app.get('/', function(req, res) {
  res.send('Hello! The API is at http://locahost:' + port + '/api')
})

// apply the routes to our application with the prefix /api
app.use('/api', routes);


//Start server
app.listen(port)
console.log('Server started!')


