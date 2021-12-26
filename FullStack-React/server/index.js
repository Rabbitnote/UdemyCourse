const express = require('express');
const app = express(); //Running express that we register | app this for setup configuration

//Here 
app.get('/',(req,res)=>{
    res.send({hi:'there'})
});

app.listen(5000);


