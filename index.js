var WebSocketServer = require('ws').Server,
	wss = new WebSocketServer({
		port: 8080
	});

wss.on('connection', function connection(ws) {
	ws.on('message', function incoming(message) {
		console.log('received: %s', message);
	});
	for (var i = 0; i < 1000; i++) {
		if (i === 250) {
			ws.send('kill');
		}
		ws.send('something');
		ws.send(new Buffer("Hello234321434123"));
	}
});
