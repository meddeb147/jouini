const express = require("express");
const db = require("./db.json");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send(db);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
