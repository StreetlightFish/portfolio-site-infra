# portfolio-site-infra
Infrastructure for Personal portfolio website


                 [ User Browser ]
                        │
                        ▼
              [ Internet Gateway ]
                        │
                        ▼
             [ OCI Load Balancer (Flexible Load Balancer – Public Subnet) ]
                        │
                        ▼
            [ OKE Basic Cluster (Private Subnet) ]
                        │
                 ┌──────┴───────┐
            [ ARM Compute VM 1 ]   [ ARM Compute VM 2 ]
                  (K8s Worker Nodes – Pods Running Dockerized Website)
                        │
                        ▼
                [ Pod Persistent Storage (Block Storage) ]
                        │
         ┌──────────────┼─────────────────┐
         ▼              ▼                 ▼
    [ Object Storage ]  [ Service Gateway ]  [ VCN Flow Logs ]
 (Static assets, backups)   (Private API access) (Networking logs/troubleshooting)




| Component	| Purpose | Free Tier Status |
| --------- | :-----: | ---------------- |
| Virtual Cloud Network (VCN) + Subnets | Software-defined network separating public and private zones | Free (2 VCNs max per tenancy) |
| Internet Gateway | Allows inbound/outbound traffic to/from internet | Free | 
| Load Balancer | Public endpoint routing to Kubernetes nodes | Always Free Flexible Load Balancer at 10 Mbps |
| OKE Basic Cluster | Managed Kubernetes control plane (limited features) | Free | 
| ARM Compute Instances | Kubernetes worker nodes running Docker ARM64 containers | Up to 4 OCPUs, 24GB RAM free |
| Block Storage | Persistent volumes for Pods | Up to 200GB free | 
| Object Storage | Static assets, logs, backups | 10GB free standard tier |
| Service Gateway | Private access to OCI services without internet | Free, optional |
| IAM & Policies | Controls access for users and services (e.g., pulling images) | Free |
| Security Lists/NSGs | Firewall rules for subnet traffic control | Free |
| VCN Flow Logs | Logs VNIC network traffic for audit and troubleshooting | Up to 10GB/month free |
