const express = require("express");
const router = express.Router();
const Message = require("../models/message");

router.post("/createmessage", async (req, res) => {
  try {
    await Message.create({ 
        Senderid: req.body.Senderid,
        Reciverid: req.body.Reciverid,
        text: req.body.text, 
    });
    res.json({ success: true });
  } catch (error) {
    console.error(error); // Log the error for debugging
    res.json({ success: false, error: error.message }); // Return the error message in the response
  }
});

module.exports = router;
