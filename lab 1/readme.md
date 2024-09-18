# LAB 1

![Diagram](./drawio.png)

Images:

- Client: j7lh/client:note-angular-0
  - ENV: API_URL
- Server: j7lh/server:note-express-mysql-0
  - ENV: DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT
- Database: mysql:5.7
  - ENV: MYSQL_DATABASE, MYSQL_TCP_PORT, MYSQL_ROOT_PASSWORD, MYSQL_USER, MYSQL_PASSWORD

---

## Day 1: Pod Management and Services

- **Goal**: Understand Pods and how to expose them via Services.
- **Practices**:
  1. **Create Client and Server Pods** using YAML manifests and `kubectl`.
  2. **Expose Server Pods** using ClusterIP, NodePort, and LoadBalancer Services.
  3. Use **labels and selectors** to differentiate Client and Server Pods.
  4. Manually **scale Pods** to verify communication between Client and Server using Services.
  5. **Verify load balancing** and traffic distribution across Server Pods.

---

## Day 2: Ingress, Egress, and Networking

- **Goal**: Configure ingress, egress, and secure communication across the architecture.
- **Practices**:
  1. **Install an Ingress Controller** (NGINX or Traefik) to manage inbound traffic for the Client.
  2. Create **Ingress resources** to route traffic to the Client Pods.
  3. Set **Egress policies** from the Server to control outbound traffic towards the database.
  4. Define **Network Policies** to isolate Client, Server, and Database Pods according to the firewall rules in your diagram.
  5. **Test traffic flows** between Client and Server Pods, and between Server and the Database.

---

## Day 3: Labels, Selectors, and Namespaces Management

- **Goal**: Organize and manage resources using labels and namespaces.
- **Practices**:
  1. **Create Labels and Selectors** to identify the Client and Server Pods.
  2. Create **Namespaces** for separating environments (e.g., client-app, server-app, database).
  3. Apply **Network Policies** to control inter-namespace communication.
  4. Deploy the architecture into different namespaces and validate **cross-namespace access**.
  5. **Move resources** between namespaces and test communication integrity.

---

## Day 4: Deployments, Scaling, and Health Checks

- **Goal**: Manage the scaling and health of Client and Server Deployments.
- **Practices**:
  1. Create a **Deployment for the Server** with multiple replicas and verify scaling.
  2. Perform **rolling updates and rollbacks** on both Client and Server Deployments.
  3. Set up and verify **Readiness, Liveness, and Startup probes** for Client and Server Pods.
  4. Implement **horizontal scaling** for both Client and Server Deployments based on demand.
  5. **Optimize resource requests** for both Deployments to manage CPU and memory consumption.

---

## Day 5: Stateful Applications and DaemonSets

- **Goal**: Deploy stateful services, including the database, and services that run on all nodes.
- **Practices**:
  1. Deploy the **database** using a **StatefulSet** (e.g., MySQL with master-slave setup for write-read operations).
  2. Set up **Persistent Volume Claims (PVCs)** for the StatefulSet to store persistent data.
  3. Deploy a **DaemonSet** for logging or monitoring agents across all nodes in the cluster.
  4. Verify the distribution of **DaemonSet Pods** across nodes and test their functionality.
  5. Compare the **behavior of StatefulSets and Deployments** to understand the differences for the database.

---

## Day 6: Persistent Storage and Configuration Management

- **Goal**: Manage persistent storage and sensitive data for the database and application configuration.
- **Practices**:
  1. Create **Persistent Volumes (PVs)** and **PVCs** for both the Client and Server components.
  2. **Mount PVCs** into Pods and verify persistent storage across restarts.
  3. Create and manage **ConfigMaps** for non-sensitive configuration (e.g., environment variables).
  4. Manage **Secrets** for sensitive data (e.g., database passwords) and use them in Pods.
  5. Test **ConfigMap and Secret usage** by injecting them into Client and Server Pods as volumes or environment variables.

---

## Day 7: Security, Resource Optimization, and Monitoring

- **Goal**: Secure the application, optimize resource usage, and monitor the system.
- **Practices**:
  1. Configure **Role-Based Access Control (RBAC)** for controlling access to the Client, Server, and Database Pods.
  2. Define **Roles, RoleBindings, and ServiceAccounts** to manage permissions across namespaces.
  3. Set **resource requests and limits** for both Client and Server Pods to optimize resource usage.
  4. Install **Prometheus and Grafana** to monitor Pod and Service metrics.
  5. Implement **Fluentd or ELK stack** for centralized logging, particularly for Server and Database Pods.
