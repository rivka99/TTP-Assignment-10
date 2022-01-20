
const express = require('express')
const bodyParser = require('body-parser')

//const db = require('./queries')
const app = express()
const port = 3000
const Pool = require('pg').Pool
const pool = new Pool({
  host: "localhost",
  dbname: "assignment10",
  user: "postgres",
  password: "1299",
  port: "5432"

})


const getEmployees = (req, res) => {
  pool.query('select * from employee order by id asc', (error, results) => {
      if (error) {
          throw error.message
      }
      res.status(200).json(results.rows)
  })
}


const addEmployee = (req, res) => {
  const info = req.body

  pool.query('insert into employee values ($1, $2, $3, $4)', [info[0], info[1], info[2], info[3]], (error, results) => {
      if (error) {
          throw error.message
      }
      res.status(201).send(`Employee added with ID: ${info[0]}`)
  })
}

app.use(bodyParser.json())
// app.use( //don't worry about this too much...
//     bodyParser.urlencoded({
//         extended : true
//     })
// )

//all this is doing is parsing our requests before the handlers do and storing it in req.body.

app.get('/', (req, res) => {
    res.json({info: "testing node, express and postgres"})
})

app.get('/employees', getEmployees)
app.post('/employees', addEmployee)
app.listen(port, () => {
    console.log(`app running on port ${port}.`)
})


// module.exports = {
//   getEmployees
//   }