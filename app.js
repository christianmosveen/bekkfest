var express = require('express');
var app = express();

app.use(express.static('.'));

/* app.get('/', function (req, res) {
  res.send('Hello World!');
}); */

app.listen(3000, function () {
  console.log('BEKKFest Heatmap listening on port 3000!');
});


// Må få inn data via en event her (dette må ligge i et js som dras inn i index.html?)
/* var heatmap = Processing.getInstanceById("heatmap");
heatmap.setData(data);
heatmap.redraw(); */