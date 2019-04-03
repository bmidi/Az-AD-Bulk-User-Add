# Az-AD-Bulk-User-Add
This script takes advantage of the Azure PowerShell "Az" module. It creates AD users from a CSV file stored in C:\temp by default.

Make sure to connect to your account using the command Connect-AzAccount, you may specify your Tenant ID (Directory) and Subscription ID (found in subscription). 

The full command is Connect-AzAccount -Tenant "*Tenant ID*" -Subscription "*Subscription ID*"

Make sure to save the command someplace safe as it will try to authenticate with your tenant once you run it, no matter where it's run. It is not recommended to keep the tenant ID and subscription ID stored in your script in case you share your copy.

You may also troubleshoot to check your tenant ID with the following URL: https://login.microsoftonline.com/<tenant>/.well-known/openid-configuration
