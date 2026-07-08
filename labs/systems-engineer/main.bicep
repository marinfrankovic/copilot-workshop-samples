// STARTER FILE — intentionally minimal.
//
// Ask GitHub Copilot (Chat, Agent mode) something like:
//   "Using architecture-brief.md in this folder, fill in this main.bicep:
//    a virtual network with one subnet, a network security group that only
//    allows SSH from the allowedSshSourceIp parameter, a public IP, a NIC,
//    a small Ubuntu 22.04 Linux VM using the admin username + SSH public key
//    parameters, and a private storage account with public blob access
//    disabled. Tag everything. DO NOT create any role assignments — I only
//    have Contributor. Explain each block."
//
// Then ask for the what-if / deploy / destroy commands and refine from there.
//
// This template deploys at RESOURCE GROUP scope.

@description('Azure region for all resources.')
param location string = resourceGroup().location

@description('Short name prefix for resource names (lowercase, 3-12 chars).')
param namePrefix string = 'contososbx'

@description('Admin username for the Linux VM.')
param adminUsername string

@description('SSH public key used to sign in to the VM (no passwords).')
@secure()
param adminSshPublicKey string

@description('Your public IP address (e.g. 203.0.113.4). Only this IP may reach SSH.')
param allowedSshSourceIp string

@description('VM size. Keep it small and cheap for a sandbox.')
param vmSize string = 'Standard_B2s'

@description('Common tags applied to every resource.')
param tags object = {
  env: 'sandbox'
  owner: 'contoso-it'
}

// Copilot: add resources below — virtual network + subnet, network security
// group (SSH from allowedSshSourceIp only), public IP, network interface,
// Linux VM (Ubuntu 22.04, vmSize, SSH key auth), and a private storage account.
// Keep it least-privilege. Do NOT add any Microsoft.Authorization/roleAssignments.
