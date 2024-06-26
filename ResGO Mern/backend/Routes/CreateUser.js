const express = require("express");
const router = express.Router();
const User = require("../models/User"); // Corrected path to User model

router.post("/createuser", async (req, res) => {
  try {

    const user = await User.findOne({ email:req.body.email });

    if (user) {
      return res.json({ exists: true, success:false,message: "Email already exist"  });
    } 

    await User.create({ // Using await to ensure User.create() completes before sending response
      name: req.body.name,
      password: req.body.password,
      email: req.body.email,
      location: req.body.location,
      role: req.body.role, 
    });
    res.json({ success: true });
  }
   catch (error) {
    console.log(error);
    res.json({ success: false }); 
  }
});




module.exports = router;
