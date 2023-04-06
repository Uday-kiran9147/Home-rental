const mongoose = require('mongoose')


const uri = "mongodb+srv://uday:TestDataBase@testingcluster.hmcvuvv.mongodb.net/?retryWrites=true&w=majority";

mongoose.connect(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
},).then(() => console.log('Connected to database')).catch((error) => console.log(error))