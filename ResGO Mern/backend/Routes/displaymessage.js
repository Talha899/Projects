const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const Message = require("../models/message"); // Make sure you have this model
const mongoURI = "mongodb+srv://Resgo:30179896@cluster0.wsjqov5.mongodb.net/Resgo?retryWrites=true&w=majority&appName=Cluster0";

router.post("/displaymessage", async (req, res) => {
    const { Senderid, Reciverid } = req.body;
    try {
      const messageData = await Message.find({
        $or: [
          { Senderid: Senderid, Reciverid: Reciverid },
          { Senderid: Reciverid, Reciverid: Senderid }
        ]
      }).sort({ createdAt: 1 });
      res.json(messageData);
    } catch (error) {
      console.error("Error fetching messages:", error);
      res.status(500).json({ error: error.message });
    }
  });
  

module.exports = router;