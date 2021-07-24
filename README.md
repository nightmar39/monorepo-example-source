# example-multiservice

Example application monorepo with 3 microservices. Each microservice directory has its own Dockerfile and Helm Chart.

Helm Charts in this repo are:

- Called by an umbrella chart in the [example-multiservice-deploy](https://github.com/codefresh-contrib/example-multiservice-deploy) GitOps deployment repo
- Versioned only when the structure of the chart changes (not for image tag changes) - this minimizes chart version sprawl
  - Image tags are referenced from Global values in the umbrella chart
