const protobufLoader = require('@grpc/proto-loader');
const grpc = require('grpc');
const path = require('path');

function load() {
    const teamProtoPath = path.join(__dirname, '..', '..', 'protos', 'team.proto');
    const teamDefinition = protobufLoader.loadSync(teamProtoPath);
    const {team} = grpc.loadPackageDefinition(teamDefinition);

    return team;
}

module.exports = {
    load
};