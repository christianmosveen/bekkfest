var init = function() {
	AWS.config.update({accessKeyId: dynamoAccessKeyId, secretAccessKey: dynamoSecretAccessKey});
	AWS.config.region = 'us-east-1';

	//var heatmapViz = Processing.getInstanceById("heatmap");

	var dynamodb = new AWS.DynamoDB.DocumentClient();

	var params = {
		TableName: "HeatMap",
		IndexName: "dummy-timestamp-index",
    	KeyConditions: {
	        Status: {
	            ComparisonOperator: "EQ", 
	            AttributeValueList: [ 
	                "ok"
	            ]
	        }
    	},
    	ScanIndexForward: false
	};

	var loadData = function () {
		dynamodb.scan(params, function (err, data) {
		  	if (err) console.log(err, err.stack);
		  	else {
		  		setBeaconData(data);
		  	}
		})
	};

	if (!demoMode) setInterval(loadData, 10000);
	
};
