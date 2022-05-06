# Google Cloud Project
## Project Info.

This project contains:
*  Infrastructure as code using [Terraform](https://www.terraform.io/) that builds an environment on the google cloud platform
* Demo app with Dockerfile
* [Kubernetes](https://kubernetes.io) YAML files for deploying the demo app

## Tools Used

<p align="center">
<a href="https://www.terraform.io/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/terraform/terraform-original-wordmark.svg" alt="terraform" width="40" height="40"/> </a> <a href="https://cloud.google.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/googlecloud/googlecloud-original.svg" alt="gcp" width="40" height="40"/> </a> <a href="https://kubernetes.io" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/kubernetes/kubernetes-icon.svg" alt="kubernetes" width="40" height="40"/> </a> <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/AbdEl-RahmanKhaled/AbdEl-RahmanKhaled/main/icons/python/python-original.svg" alt="python" width="40" height="40"/> </a>
</p>

## Get Started

### Get The Code 
* Using [Git](https://git-scm.com/), clone the project.

    ```
    git clone https://github.com/AbdEl-RahmanKhaled/GCP-Infrastructure.git
    ```
### Setup Infra
* First setup your GCP account, create new project and change the value of "project_name" variable in terraform/default.tfvars with your PROJECT-ID.

* Second build the infrastructure by run

    ```bash
    cd terraform/
    ```

    ``` 
    terraform init
    terraform apply --var-file default.tfvars
    ```
    that will build:
    
    * VPC named "vpc-network"
    * 2 Subnets "management-sub", "restricted-sub"
    * 3 Service Accounts
        * "gke-sa" used by Kubernetes cluster
        * "gke-management-sa" used by Management VM 
        * "docker-gcr-sa" we will use it to push the image to GCR

    * NAT in "management-sub"
    * Private Virtual Machine in "management-sub" subnet to manage the cluster.
    * Private Kubernetes cluster in "restricted-sub" with 3 worker nodes.

        ```bash
        # NOTE
        Only the VMs in "management-sub" subnet can access the Kubernetes cluster.
        ```
    you can change some variables values in "terraform/default.tfvars"
    
### Build & Push Docker Image to GCR
* Build the Docker Image by run

    ```bash
    docker build -t eu.gcr.io/<PROJECT-ID>/my-app:1.0 src/
    ```
* Setup credentials for docker to Push to GCR using "docker-gcr-sa" Service Account

    ```
    gcloud auth activate-service-account docker-gcr-sa --key-file=KEY-FILE
    gcloud auth configure-docker
    ```
* Push the Created Image to GCR

    ```
    docker push eu.gcr.io/<PROJECT-ID>/my-app:1.0
    ```

### Deploy
* After the infrastructure got built, now you can login to the "management-vm" VM using SSH then:
    
    * Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) tool
    * setup cluster credentials
        ```
        gcloud container clusters get-credentials app-cluster --zone europe-west1-b --project <PROJECT-ID>
        ```
    * Change image in "kubernetes/deployments/app-deployment.yaml" with your image

    * Upload the "kubernetes" dir to the VM and run
    
        ```
        kubectl apply -f kubernetes/
        ```

        that will deploy:
        
        * Config Map for environment variables used by demo app
        * Redis Pod and Exopse the pod with ClusterIP service
        * Demo App Deployment and Exopse it with NodePort service
        * Ingress to create HTTP loadbalancer

---
Now, you can access the Demo App by hitting the Ingress IP 

You can try my deployed demo from [here](http://34.149.104.173/)