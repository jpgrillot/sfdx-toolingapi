# Salesforce Org Explorer tooling API app

This application features an Org Explorer app which uses the Tooling API to provide metadata info and dependencies.

The app features a home page with:
  * A Lightning Web Component using the Dependency API to show metadata dependencies
  * A Visualforce Page to list all the fields of objects (Standard, Custom, Custom Metadata, Custom Settings)

## Installation and Configuation
### Install
You can install this app by using the install URL https://login.salesforce.com/packaging/installPackage.apexp?p0=04t8c000000iAoPAAU
Note: This is a beta package and can only be installed in Development Edition orgs or Sandboxes. 
You can also install this by logging into your org and appending the above /packaging... url into the address bar.
For example: you are logged into https://mysandbox.sandbox.my.salesforce.com the url would be https://mysandbox.sandbox.my.salesforce.com/packaging/installPackage.apexp?p0=04t8c000000iAoPAAU

### Configuration
After installing the App, you will need to configure connectivity to the tooling API.
#### Create a Connected App
 1. In Setup, go to the App Manager
 1. Create a Connected App - ToolingApiApp
  1. For thw scopes, select Full Access (full) and Perform Requests at any time (refresh_token)
  
#### Create a Remote Site
For the toolingAPI explorer to work, create a remote site: 
 1. In Setup, go to Security > Remote Site Settings
 1. Create a Remote Site
  1. Name: ToolingAPI
  1. URL: yoursandbox URL 
  1. Ensure it is active and click Save.


## Resources
### Code Base References
 - [Find Referenced Metadata using Salesforce Dependency API](https://salesforcecodex.com/salesforce/find-referenced-metadata-using-salesforce-dependency-api/)
 - [Tooling API](https://www.mstsolutions.com/technical/tooling-api/)

### DX References

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
