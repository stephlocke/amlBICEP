# amlBICEP
This is a repo showcasing how to create an Azure Machine Learning Workspace programmatically.

The main file is `aml.bicep` which would be deployed with parameters. Upstream dependencies like storage accounts are created in modules with a conditional deployment demonstrated for the Container Registry.

You can deploy the bicep using a variety of tools but the Azure CLI is demonstrated in `deploy.cli`. This file includes how to get the Azure CLI in an Ubuntu environment, connect to your Azure subscription, build an ARM template, create a resource group, and then perform a deployment. The additional items before doing a deployment are intended to support a setting up of an environment if required.

