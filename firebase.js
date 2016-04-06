var Firebase = require('firebase');
var firebase = new Firebase("https://bekkfest.firebaseio.com/");

//var beaconData = new Firebase("https://bekkfest.firebaseio.com/beacon");


//firebase.set([])
//test.push({beaconId: 567, dist: 6, timestamp: 1459533071676})

var entry = {beaconId: 567, dist: 6, timestamp: 1459533071676}

firebase.once('value', function(snapshot) {
	console.log(snapshot.val());
	firebase.set(snapshot.val() ? snapshot.val().concat([entry]) : [entry]);
});

setTimeout(function() {
	console.log('hi');
	firebase.set([entry]);
}, 1500);

var count = 0;
firebase.on('value', function(snapshot) {
	console.log(count++, snapshot.val());
})