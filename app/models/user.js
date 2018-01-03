var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var User = mongoose.model('User', new Schema({
  name: String,
  email: String,
  password: String,
  age: Number,
  height: Number,
  weight: Number,
}, { 
  timestamps: { 
    created_at: 'created_at', 
    updated_at: 'updated_at'
  }
}));



module.exports = User