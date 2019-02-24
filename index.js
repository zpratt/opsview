const grpc = require('grpc');
const teamProtoLoader = require('./src/services/team-proto-loader');
const port = '8081';
const host = `localhost`;

function start() {
    const server = new grpc.Server();
    const teamPackageDef = teamProtoLoader.load();

    server.addService(teamPackageDef.TeamService.service, {
        getTeams: (call, cb) => {
            console.log('received call to getTeams', call);

            cb(null, {teams: [{name: 'test team'}]});
        }
    });

    server.bind(`${host}:${port}`, grpc.ServerCredentials.createInsecure());
    server.start();

    console.log(`server started on ${host}:${port}`);
}

start();