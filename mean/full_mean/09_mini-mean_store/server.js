const mongoose = require('mongoose')
const express = require('express')
const path = require('path')
const bodyParser = require('body-parser')
const session = require('express-session')
const app = express()
const port = process.env.PORT || 8000

app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json()) // render json

app.use(express.static(path.join(__dirname, './client')))
app.use(express.static(path.join(__dirname, './bower_components')))

require('./server/config/mongoose.js') // load mongoose connector
require('./server/config/routes.js')(app) // load router

app.listen(port, ()=>{console.log('Server running on port#', port )}) // start server