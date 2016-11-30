const httpProxy = require('http-proxy');
const fs = require('fs');

httpProxy.createServer({
  target: {
    host: 'currentcondition.org',
    port: 80
  },
  ssl: {
    key: fs.readFileSync('server.key', 'utf8'),
    cert: fs.readFileSync('server.crt', 'utf8')
  }
}).listen(8009);

httpProxy.createServer({
  target: {
    host: 'currentcondition.org',
    port: 80
  }
}).listen(8010);
