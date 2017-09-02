var WebSocketClient = require('websocket').client;

// var fs = require('fs');
// fs.appendFileSync(__dirname + "/websocket.txt", "Create file by gasmx!\n");

var client = new WebSocketClient();

client.on('connectFailed', function(error) {
   console.log('Connect Error: ' + error.toString());
});

client.on('connect', function(connection) {
   console.log('WebSocket Client Connected');

   connection.on('error', function(error) {
       console.log("Connection Error: " + error.toString());
   });

   connection.on('close', function() {
       console.log('echo-protocol Connection Closed');
   });

   connection.on('message', function(message) {
        if (message.type === 'utf8') {
            console.log("Received: '" + message.utf8Data + "'");
        }
   });
});

client.connect('ws://34.212.9.57:5000');