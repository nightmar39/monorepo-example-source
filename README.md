# example-multiservice

Example application monorepo with 3 microservices. Each microservice directory has its own Dockerfile and Helm Chart.

Helm Charts in this repo are:

- Versioned only when the structure of the chart changes (not for image+tag changes)
- Called by an umbrella chart in [example-multiservice-deploy](https://github.com/codefresh-contrib/example-multiservice-deploy)
- <a href="https://github.com/codefresh-contrib/example-multiservice-deploy" target="_blank">example-multiservice-deploy</a>
- Reference their image+tag from Global values in the umbrella chart
