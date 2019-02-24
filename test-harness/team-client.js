const teamProtoLoader = require('../src/services/team-proto-loader');
const grpc = require('grpc');

function testTeamServices() {
    const teamPackageDef = teamProtoLoader.load();
    const client = new teamPackageDef.TeamService('localhost:8081', grpc.credentials.createInsecure());

    console.log('about to call getTeams');
    client.getTeams({}, (err, result) => {
        console.log(`called getTeams and received ${JSON.stringify(result)}`);
    });
}

testTeamServices();