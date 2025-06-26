# -------------------------------------------- SECURITY -----------------------------------------------
# Security scanning is important to detect vulnerabilities in images (*DTR: Docker Trusted Registry)

# Old Docker Suite:             | Usage                               |  Replaced by
# Universal Control Plane (UCP) | cluster and container management    |  Rancher, OpenShift, Lens, AWS EKS, 
# Docker Trusted Registry (DTR) | Private image storage and scanning  |  Harbor, Jfrog, AWS ECR
# Docker Engine Enterprise      | Hardenened version of Docker Engine |  containerd, MCR, CRI-O