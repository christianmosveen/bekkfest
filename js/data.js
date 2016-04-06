var init = function() {
	AWS.config.update({accessKeyId: 'X', secretAccessKey: 'Y'});
	AWS.config.region = 'us-east-1';

	//var heatmapViz = Processing.getInstanceById("heatmap");

	var dynamodb = new AWS.DynamoDB.DocumentClient();

	var params = {
		TableName: "HeatMap"/*,
		KeyConditionExpression: "beaconId = :beaconId",
	    ExpressionAttributeNames:{
	        "#yr": "year"
	    },
	    ExpressionAttributeValues: {
	        ":yyyy":1985
	    }*/
	};

	var loadData = function () {
		dynamodb.scan(params, function (err, data) {
		  	if (err) console.log(err, err.stack);
		  	else {
		  		setBeaconData(data);
		  	}
		})
	};

	//setInterval(loadData, 10000);
	
};
