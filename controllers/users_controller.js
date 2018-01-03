var express = require('express');
var bcrypt  = require('bcrypt');
var jwt     = require('jsonwebtoken');
var app     = express();

var config  = require('../config/secrets');
var User = require('../app/models/user');

app.set('superSecret', config.secret)

var UsersController = class UsersController {
  constructor() {}

  static create(req, res) {
    if(req.body.password !== null && req.body.name !== null) {
      bcrypt.hash(req.body.password, 10).then(function(hash) {
        var user = new User({ 
          name: req.body.name, 
          password: hash
        });
        
        user.save(function(err) {
          if (err) throw err;

          console.log('User saved successfully');
          res.json({ success: true });
        });
      });
    } else {
      res.json({success: false, message: 'Missing required parameters'})
    }
  }

  static update(req, res){

  }

  static authenticate(req, res) {
    User.findOne({
      name: req.body.name
    }, function(err, user) {

      if (err) throw err;
      
      if (!user) {
        res.json({ success: false, message: 'Authentication failed. User not found.' });
      } else if (user) {
        bcrypt.compare(req.body.password, user.password).then(function(found) {
          console.log(found)
          if(found == false) {
            res.json({ success: false, message: 'Authentication failed. Wrong password.' });
          } else {
            const payload = {};
            
            jwt.sign(payload, app.get('superSecret'), {
              expiresIn : '24 hours' // expires in 24 hours
            }, function(error, token) {
              res.json({
                success: true,
                message: 'Enjoy your token!',
                token: token
              });
            });
          }
        });
      }   

    });
  }

}

module.exports = UsersController
