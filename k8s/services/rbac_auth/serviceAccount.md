Kubernetes Service Account

A Service Account in Kubernetes is used to authenticate Pods and provide them with permissions to access the API server securely. Each Pod runs under a Service Account, which can be assigned specific RBAC (Role-Based Access Control) permissions.
Why Use Service Accounts?

    Secure API Access → Provides authentication for Pods to access the Kubernetes API.

    Fine-Grained Permissions → Grants only necessary permissions using RBAC.

    Workload Identity Management → Helps Pods interact with cloud services securely.

Creating a Service Account

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
  namespace: default
```

    This creates a Service Account named my-service-account in the default namespace.

Assigning a Service Account to a Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  serviceAccountName: my-service-account
  containers:
    - name: my-container
      image: my-app-image
```
    The my-service-account is assigned to the Pod, enabling it to authenticate with Kubernetes APIs.

Granting Permissions Using RBAC

By default, a Service Account has no permissions. You must create a Role or ClusterRole and bind it.

Example: Role & RoleBinding (Namespace-Specific Permissions)

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list"]

apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader-binding
  namespace: default
subjects:
  - kind: ServiceAccount
    name: my-service-account
    namespace: default
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

    This allows my-service-account to list and get Pods in the default namespace.

Using Service Account with a Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      serviceAccountName: my-service-account
      containers:
        - name: my-container
          image: my-app-image

    Every Pod in this Deployment will use my-service-account for API access.
```