const express = require('express');
const app = express(); //Running express that we register | app this for setup configuration

//Here 
app.get('/',(req,res)=>{
    res.send({hi:'there'})
});
const PORT = process.env.PORT || 5000;
app.listen(PORT);


