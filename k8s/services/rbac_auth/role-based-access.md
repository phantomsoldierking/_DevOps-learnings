A Role is a namespaced Kubernetes object that defines a set of permissions within a specific namespace. It grants access to resources such as Pods, ConfigMaps, and Deployments based on verbs (actions) like get, list, create, delete, and update.

Example: Creating a Role

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
```

This Role named pod-reader allows users to get and list Pods within the default namespace.
What is a RoleBinding?

A RoleBinding associates a Role with a user, group, or service account, granting the permissions defined in the Role.

Example: Creating a RoleBinding

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader-binding
  namespace: default
subjects:
- kind: User
  name: alice
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
  ```

This RoleBinding assigns the pod-reader Role to the user alice in the default namespace.
Use Cases
1. Restricting Access to Specific Namespaces

    Using Role and RoleBinding ensures that a user or application can access only the required resources within a namespace.

2. Granting Cluster-Wide Permissions

    ClusterRole and ClusterRoleBinding provide necessary access across all namespaces, useful for administrators and monitoring tools.

3. Enforcing Least Privilege Access

    Assigning only necessary permissions ensures security and reduces the risk of unauthorized access.

Managing Role and RoleBinding

To list Roles in a namespace:

```
kubectl get roles -n default
```
To list RoleBindings in a namespace:

```
kubectl get rolebindings -n default
```
To list ClusterRoles:

```
kubectl get clusterroles
```
To list ClusterRoleBindings:

```
kubectl get clusterrolebindings
```