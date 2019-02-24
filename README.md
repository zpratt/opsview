Opsview
---

This is current a barely functional experiment using grpc and node. I'm intrigued by grpc for the possibility of eliminating the need for a framework to provide routing, middleware, etc. The future plan is to use a combination of grpc, grpc-web, and envoy for the stack.

### Running Locally

#### Start the server

1. Install nvm
2. `nvm use`
3. `npm i`
4. `npm start` -> starts the server

#### Run the super primitive test client

1. `nvm use`
2. `node ./test-harness/team-client.js`

### Inspiration

* [Envoy with GRPC-Web](https://blog.envoyproxy.io/envoy-and-grpc-web-a-fresh-new-alternative-to-rest-6504ce7eb880)
* [Node + GRPC + Postgres](https://mherman.org/blog/node-grpc-postgres/)
* [Kotlin + GRPC + Envoy](https://developers.redhat.com/blog/2018/12/24/using-a-kotlin-based-grpc-api-with-envoy-proxy-for-server-side-load-balancing/)

### TODO

1. [x] Add basic boilerplate for GRPC
2. [ ] Complete this list
2. [ ] Add a docker-compose with postgres, flyway, and envoy
3. [ ] Add an envoy configuration
4. [ ] Add flyway to run the migrations in `src/db`
5. [ ] Figure out how to TDD GRPC
6. [ ] Discover teams in github orgs
7. [ ] Discover pipelines in concourse
8. [ ] Discover namespaces in kubernetes
