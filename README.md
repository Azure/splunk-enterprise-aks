# Splunk Enterprise on Azure Kubernetes Service

This repo contains automation for deploying the Splunk Enterprise Operator for Kubernetes on AKS. This includes:
- The deployment of a virtual network for the AKS cluster
- The deployment of a storage account and container
- The deployment of a private DNS zone
- The deployment of a private storage endpoint in the cluster virtual network
- The deployment of an AKS cluster across 3 Availability Zones
- The deployment of the Splunk Operator for Kubernetes (with multi-site Indexer cluster) via Deployment Script
- The deployment and configuration of the open source tool min.io to enable Splunk's SmartStore feature with Azure blob storage via Deployment Script
- The deployment of App Gateway & Ingress Controller for access to Splunk UI
- Disabling Transparent Huge Pages in line with Splunk best practices, using the AKS Custom Node Configuration feature

> This repo is still in development, if you do find a bug or require an additional feature please do raise an issue or contribute by creating a pull request!

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fsplunk-enterprise-aks%2Fmain%2Fazuredeploy.json" target="_blank">
<img src="https://aka.ms/deploytoazurebutton"/>
</a>

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
