# RayFlow
Collection of tools and snippets for RayFlow Server and Client

# Prerequisites
A PowerShell module "RayFlow" is required to run the samples. You can install it by executing our MSI installer ``RayFlow.PowerShell.msi``, which is located in subfolder ``/Tools`` where your RayFlow instance is installed. Note that the module is to be installed on client machines that connect to the RayFlow server, you do not have to install it on the server itself.

Once the module is available, it should be automatically imported whenever you need any of its function. In case of administrative installation, you should import module definition file ``RayFlow.psd1`` from the root path where the automation module is installed.

    Import-Module <extracted-path>\RayFlow.psd1

# Samples listing
## Basics
| File     | Description  |
| -------------------------- | ---------------------------------------------------------- |
| **[HelloWorld.ps1](PS1-Samples/Basics/HelloWorld.ps1)** | Connect to RayFlow and list available projects. |
| **[ReadPackagesFromSpecificPhases.ps1](PS1-Samples/Basics/ReadPackagesFromSpecificPhases.ps1)** | Simple reading of packages from specific phases. |