########################################################################################################################
#                                                                                                                      #
# This script takes advantage of the Azure PowerShell Az module. This is not meant to be used with the AzureRM module. #
#                                                                                                                      #
#                        Created by Benjamin Midyette (github.com/bustelyo) MIT License                                #
#                                                                                                                      #
########################################################################################################################


# Connect-AzAccount -Tenant ""  -Subscription ""

$users = Import-Csv -Delimiter "," -Path "C:\temp\userlist.csv" # Import userlist.csv

$secureStringPassword = ConvertTo-SecureString -String "Password1" -AsPlainText -Force # Create a Secure String object to contain the password string defined here

foreach ($user in $users) {
    $displayName = $user.Firstname + " " + $user.Lastname # Display Name consists of First and Last name
    $domain = "lynnes.onmicrosoft.com" # Set domain to correct domain name
    $userPrincipalName = $user.Firstname.ToLower()[0] + $user.Lastname.ToLower() + "@" + $domain # Changes first and last name to lowercase, then creates 'first initial' character for Principla Name/Sign in, creates the principal name from first initial, last name, and domain
    $mailNickname = $user.Firstname.ToLower()[0] + $user.Lastname.ToLower()
    New-AzADUser -DisplayName $displayName -UserPrincipalName $userPrincipalName -Password $secureStringPassword -MailNickname $mailNickname -ForceChangePasswordNextLogin -Confirm
    Add-AzADGroupMember -MemberUserPrincipalName $userPrincipalName -TargetGroupDisplayName $user.Company -Confirm
}

# The SAM Account name (logon name) used to support clients and servers running earlier versions of the operating system.
# Mail Nickname is an 'email alias' and usually matches the SAM account name. New-AzADUser has a parameter to define the Mail Nickname with -MailNickname (string)
