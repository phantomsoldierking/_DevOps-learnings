1. Node Affinity

    Ensuring that workloads requiring SSD storage run on nodes labeled with storage=ssd.

    Running GPU-intensive workloads on nodes labeled gpu=true.

2. Pod Affinity

    Ensuring that microservices communicate efficiently by scheduling them on the same node.

    Keeping interdependent applications (e.g., frontend and backend) close together to reduce latency.

3. Pod Anti-Affinity

    Distributing replicas of an application across multiple nodes for high availability.

    Ensuring that critical workloads are not placed on the same node to prevent single points of failure.

Node Affinity Syntax

Node Affinity rules are defined in the Pod specification under affinity.nodeAffinity.
Example: Scheduling a Pod on SSD Nodes

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ssd-pod
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: "storage"
                operator: "In"
                values:
                  - "ssd"
  containers:
    - name: app
      image: my-app
```

This ensures that the Pod is scheduled only on nodes labeled storage=ssd.
Pod Affinity Syntax

Pod Affinity rules are defined under affinity.podAffinity.
Example: Placing Pods Close Together

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: web-pod
spec:
  affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        labelSelector:
          matchLabels:
            app: frontend
        topologyKey: "kubernetes.io/hostname"
  containers:
    - name: web
      image: nginx
```

This ensures that the Pod is scheduled on the same node as other Pods labeled app=frontend.
Pod Anti-Affinity Syntax

Pod Anti-Affinity is defined under affinity.podAntiAffinity.
Example: Spreading Replicas Across Nodes

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: backend-pod
spec:
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        labelSelector:
          matchLabels:
            app: backend
        topologyKey: "kubernetes.io/hostname"
  containers:
    - name: backend
      image: my-backend
```

This ensures that backend Pods are scheduled on different nodes to improve reliability.