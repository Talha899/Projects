const mongoose = require("mongoose");

const { Schema } = mongoose;

const MessageSchema = new Schema({
  Senderid: {
    type: String,
    required: true,
  },
  Reciverid: {
    type: String,
    required: true,
  },
  text: {
    type: String,
    required: true,
  },
  date: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model('Message', MessageSchema); 