What is a ClusterRole?

A ClusterRole is similar to a Role but applies permissions cluster-wide instead of being restricted to a specific namespace.
What is a ClusterRoleBinding?

A ClusterRoleBinding associates a ClusterRole with a user, group, or service account, granting them the specified permissions at the cluster level.
Use Cases

ClusterRole and ClusterRoleBinding are useful in various scenarios:
1. Granting Read-Only Access to All Namespaces

    Providing read-only permissions to developers for all cluster resources.

2. Managing Cluster-Wide Resources

    Controlling access to cluster-wide resources like nodes, persistent volumes, and namespaces.

3. Granting Admin Access Across Namespaces

    Assigning administrative privileges to users who need to manage resources across multiple namespaces.

ClusterRole Syntax

A ClusterRole is created using the following YAML configuration:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-admin-role
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "nodes"]
    verbs: ["get", "list", "watch"]
```

This ClusterRole allows listing and reading Pods, Services, and Nodes across the cluster.
ClusterRoleBinding Syntax

A ClusterRoleBinding links a ClusterRole to a user, group, or service account.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-admin-binding
subjects:
  - kind: User
    name: john-doe
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: cluster-admin-role
  apiGroup: rbac.authorization.k8s.io
```

This binding grants the user john-doe the permissions defined in cluster-admin-role across the cluster.
Removing ClusterRole and ClusterRoleBinding

To delete a ClusterRole:

```
kubectl delete clusterrole cluster-admin-role
```
To delete a ClusterRoleBinding:

```
kubectl delete clusterrolebinding cluster-admin-binding
```