# Az-AD-Bulk-User-Add
This script takes advantage of the Azure PowerShell "Az" module. It creates AD users from a CSV file stored in C:\temp by default.

Make sure to connect to your account using the command Connect-AzAccount, you may specify your Tenant ID (Directory) and Subscription ID (found in subscription). 
The full command is Connect-AzAccount -Tenant "*Tenant ID*" -Subscription "*Subscription ID*"
