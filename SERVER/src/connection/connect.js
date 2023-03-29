const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/students-api', {
    useCreareIndex: true,
    useNewUrlParser: true,
    UseUnifiedTopology: true,
}).then(()=>{
    console.log('connection established');
}).catch((e)=>{
    console.log('error connecting to')
})