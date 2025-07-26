# Sports_Azure_Data_Pipeline

This repo extracts data from an external Soccer Rest API and utilizes Azures data platform for data integration and Orchestration. Furthermore, this Data pipeline utilizes Azure data foctory to connect to the external API, Azure data lake storage for storage and synapse notebooks to utilize apache spark for data processing for bronze, silver and gold table development.


-------------------------------------------------------------------------------------------------------------------------------------------------------------

This pipeline utilizes terraform for deploying resources on Azure. The three components here are the Terraform CLI, Terraform Provider, and the Azures resource manager. Together these create IAC. 

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
 - ARM then processes the API Request and then sends the metadata and current state back to terraform