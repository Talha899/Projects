const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const Message = require("../models/message");
const User = require("../models/User");

router.post("/inboxmessages", async (req, res) => {
    const { Senderid } = req.body;
    try {
        // Find messages where the sender or receiver is the current user
        const messages = await Message.find({
            $or: [
                { Senderid: Senderid },
                { Reciverid: Senderid }
            ]
        });

        // Get unique user IDs, excluding the current user
        const uniqueUserIds = [...new Set(messages.flatMap(msg => {
            if (msg.Senderid === Senderid) {
                return [msg.Reciverid];
            } else {
                return [msg.Senderid];
            }
        }))];

        // Fetch user details for each unique user id
        const users = await User.find({ _id: { $in: uniqueUserIds } }, 'name _id');
        const uniqueUsersFormatted = users.map(user => ({ Reciverid: user._id, name: user.name }));
        
        res.json(uniqueUsersFormatted);
    } catch (error) {
        console.error("Error fetching chat users:", error);
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
