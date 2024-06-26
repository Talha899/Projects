const express = require("express");
const cors = require('cors');
const app = express();
const port = 5000;
const mongoDB = require("./db");



app.use(cors());


app.use((req,res,next)=>{
  res.setHeader("Access-Control-Allow-Origin","http://localhost:3000");
  res.setHeader("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept"); 
  next(); // Added next() to continue to the next middleware
});
mongoDB();

app.use(express.json())
app.use('/api',require("./Routes/CreateUser"));
app.use('/api',require("./Routes/LoginUser"));
app.use('/api',require("./Routes/DisplayMenu"));
app.use('/api',require("./Routes/DisplayDiscounts"));
app.use('/api',require("./Routes/DisplayComments"));
app.use('/api',require("./Routes/CreateMenu"));
app.use('/api',require("./Routes/CreateDiscounts"));
app.use('/api',require("./Routes/CreateComments"));
app.use('/api',require("./Routes/deletecards"));
app.use('/api',require("./Routes/createmessage"));
app.use('/api',require("./Routes/displaymessage"));
app.use('/api',require("./Routes/inboxmessages"));
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
