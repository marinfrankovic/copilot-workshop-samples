// STARTER FILE — intentionally minimal.
// Ask Copilot: "Using architecture-brief.md, build this main.bicep: resource group
// items (storage account, Linux App Service plan + web app), a managed identity for
// the web app with least-privilege access to the storage account, tags, and
// diagnostic settings. Add parameters and sensible defaults. Explain each block."
//
// Then ask for the deploy/validate/destroy commands and refine from there.

@description('Azure region for all resources.')
param location string = 'westeurope'

@description('Short name prefix for resource names.')
param namePrefix string = 'contosorpt'

@description('Common tags applied to every resource.')
param tags object = {
  env: 'demo'
  owner: 'contoso-it'
}

// Copilot: add resources below (storage, app service plan, web app,
// managed identity + role assignment, diagnostics). Keep it least-privilege.
