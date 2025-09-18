# Sports_Azure_Data_Pipeline


Steps for replication:

1. python3 -m venv venv
2. source ./venv/bin/activate
3. Install Terraform:
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
4. Verify:  terraform -version
5. Install Azure CLI:
    brew install pipx
    pipx ensurepath
    pipx install azure-cli
6. Verify: az version


-----------------------------------------------
This repo extracts data from an external Soccer Rest API and utilizes Azures data platform for data integration and Orchestration. Furthermore, this Data pipeline utilizes Azure data factory to connect to the external API, Azure data lake storage for storage and synapse notebooks to utilize apache spark for data processing for bronze, silver and gold table development.


-------------------------------------------------------------------------------------------------------------------------------------------------------------

This pipeline utilizes terraform for deploying resources on Azure. The three components here are the Terraform CLI, Terraform/Azure Provider, and Azures resource manager. Together these create IAC. 

Terraform CLI: Performs 3 main tasks

 - Loads terraform config files - These are .tf files that allow to outline what resources to deploy
 - Downloads azure provider plugin - Ensuring terraform can communciate with Azure
 - Provides Plan, Apply & Destroy commands - Allow to preview changes, deploy resources, and spin them down

Terraforms state allows for changes to be detected such that engineers have the capacity to determine when something needs to be changed, updated, or deleted. 

Terraform Provider: Bridge component between Terraform and Azure

 - Allows for authentication through Azure CLI &/OR Services Principal for which it then translates terraform code into API calls that communiciates to Azures resource manager.  

Azure Resource Manager (ARM): The control tower

 - ARM receives the API calls from the Azure/Terraform Provider and handles the resource deployment.
 - ARM also handles API request validdation and communciates with Azure Infrastructure/services to create update and delete resources
 - ARM then processes the API Request and then sends the metadata and current state back to terraform for saving the terraform state file


Terraform CLI is where code execution occurs to ensure you can manage the infrastrucutres lifecycle. The terraform provider allows for turning cloud configurations into API calls for which the Azure resource manager validates the request for forcing policies that interact with Azure services. This workflow allows for consistent infrastructure deployment.

-------------------------------------------------------------------------------------------------------------------------------------------------------------


