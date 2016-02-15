jQuery(document).ready(function(){
    $.ajax({
    url: "/api/getAllSamples",
    success: function(data){
      console.log(data);
      chartData();
      drawGroupChart(data);
    }
    });

  	$("#factors").change(function() {
   		call();
      chartData();
	});
  	$("#sites").change(function() {
   		call();
	});
});


function chartData(){
  $.ajax({
    url: "/api/"+$("#factors").val(),
    success: function(data){
      console.log(data);
      drawChart(data.factor_weights, data.site_names);
    }
    });
}

function call() {
	$.ajax({
    url: "/api/"+$("#factors").val()+"/"+$("#sites").val(),
    success: function(msg){
    	console.log(msg);
    	genTable(msg);
    }
   	});
}
  
function genTable(entry){
	var tableEntry = "<td>" + entry.sample.id + "</td><td>" + entry.sample.site + "</td><td>" + entry.sample.chloroform + "</td><td>" + entry.sample.bromoform + "</td><td>" + entry.sample.bromodichloromethane + "</td><td>" + entry.sample.dibromichloromethane +"</td><td>" + entry.factor + "</td>" ;
	$("#new").empty();
	$("#new").append(tableEntry);
}


function drawChart(row, col){
  var trace1 = {
  x: col,
  y: row,
  type: 'bar'
};

var data = [trace1];

var layout = {
  title: 'Factor VS All Sites'
};

Plotly.newPlot('left', data, layout);
}

function drawGroupChart(data){
 
  var sites = []
  var chloroform = [], bromoform = [], bromodichloromethane = [], dibromichloromethane = [];

  for(var i=0; i< data.length; i++){
    sites.push(data[i].site);
    chloroform.push(data[i].chloroform);
    bromoform.push(data[i].bromoform);
    bromodichloromethane.push(data[i].bromodichloromethane);
    dibromichloromethane.push(data[i].dibromichloromethane);
  }

  var trace1 = {
  x: sites,
  y: chloroform,
  name: 'Chloroform',
  marker: {color: 'rgb(71, 180, 2)'},
  type: 'bar'
};

var trace2 = {
  x: sites,
  y: bromoform,
  name: 'Bromoform',
  marker: {color: 'rgb(179, 133, 2)'},
  type: 'bar'
};

var trace3 = {
  x: sites,
  y: bromodichloromethane,
  name: 'Bromodichloromethane',
  marker: {color: 'rgb(39, 92, 212)'},
  type: 'bar'
};

var trace4 = {
  x: sites,
  y: dibromichloromethane,
  name: 'Dibromichloromethane',
  marker: {color: 'rgb(236, 43, 43)'},
  type: 'bar'
};

var data = [trace1, trace2, trace3, trace4];

var layout = {
  title: 'Water Contamination',
  xaxis: {tickfont: {
      size: 14,
      color: 'rgb(107, 107, 107)'
    }},
  yaxis: {
    title: 'Weight (mg/L)',
    titlefont: {
      size: 16,
      color: 'rgb(107, 107, 107)'
    },
    tickfont: {
      size: 14,
      color: 'rgb(107, 107, 107)'
    }
  },
  legend: {
    x: 0,
    y: 1.0,
    bgcolor: 'rgba(255, 255, 255, 0)',
    bordercolor: 'rgba(255, 255, 255, 0)'
  },
  barmode: 'group',
  bargap: 0.15,
  bargroupgap: 0.1
};

Plotly.newPlot('right', data, layout);

}