const express = require('express');
require('./services/passport');
const app = express(); //Running express that we register | app this for setup configuration
require('./routes/authRoutes')(app);

//Here
// app.get('/',(req,res)=>{
//     res.send({bye:'buddy'})
// });
const PORT = process.env.PORT || 5000;
app.listen(PORT);
