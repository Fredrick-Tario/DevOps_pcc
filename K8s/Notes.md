K8s = container orchestration platform

Laptop > docker
        > App Container
        > DB Container
        > Redis Container

Containers (Portable, lightweight, consistent)

Docker doesn't solve:
Server 1
    > Container A
    > Container B

Server 2
    > Container C

K8s
> Server 1 > Pods
> Server 2 > Pods
> Server 3 > Pods

> Automatically
    > recreates containers
    > balances traffic
    > deploys updates
    > scales during peak hours

Architecture of K8s
Cluster
> Control Plane
> Worker Nodes

kubectl apply > API Server

Scheduler:
Worker 1? CPU Full

Worker 2> Enough Memory > Deploy

Controller Manager
desired: 3 pods
realirt: 2 pods
controller creates another pod



