[CmdletBinding()]
param (
    [Parameter()][String]$DeploymentConfigPath = "./src/data/eslzArm.test.deployment.json",
    [Parameter()][String]$esCompanyPrefix
)

Import-Module -Name Az.MySql
Import-Module -Name Az.Resources
Import-Module "$($PSScriptRoot)/../../tests/utils/Policy.Utils.psm1" -Force
Import-Module "$($PSScriptRoot)/../../tests/utils/Rest.Utils.psm1" -Force
Import-Module "$($PSScriptRoot)/../../tests/utils/Test.Utils.psm1" -Force
Import-Module "$($PSScriptRoot)/../../tests/utils/Generic.Utils.psm1" -Force

Describe "Testing policy 'Deny-MySql-http'" -Tag "deny-mysql-http" {

    BeforeAll {
        
        # Set the default context for Az commands.
        Set-AzContext -SubscriptionId $env:SUBSCRIPTION_ID -TenantId $env:TENANT_ID -Force

        if (-not [String]::IsNullOrEmpty($DeploymentConfigPath)) {
            Write-Information "==> Loading deployment configuration from : $DeploymentConfigPath"
            $deploymentObject = Get-Content -Path $DeploymentConfigPath | ConvertFrom-Json -AsHashTable

            # Set the esCompanyPrefix from the deployment configuration if not specified
            $esCompanyPrefix = $deploymentObject.TemplateParameterObject.enterpriseScaleCompanyPrefix
            $mangementGroupScope = "/providers/Microsoft.Management/managementGroups/$esCompanyPrefix-corp"
        }

        $definition = Get-AzPolicyDefinition | Where-Object { $_.Name -eq 'Deny-MySql-http' }
        New-AzPolicyAssignment -Name "TDeny-MySql-http" -Scope $mangementGroupScope -PolicyDefinition $definition

    }

    Context "Test SSL on MySQL database servers when created or updated" -Tag "deny-mysql-http" {

        It "Should deny non-compliant SSL on MySQL database servers - SSL Disabled" -Tag "deny-mysql-http" {
            AzTest -ResourceGroup {
                param($ResourceGroup)

                $random = GenerateRandomString -Length 13
                $password = GenerateRandomString -Length 20  | ConvertTo-Securestring -AsPlainText -Force
                $name = "mysql-$Random" 

                # Deploying the compliant Application Gateway with WAF enabled
                {
                    New-AzMySqlServer -Name $name -ResourceGroupName $ResourceGroup.ResourceGroupName -Location "uksouth" -AdministratorUserName mysql_test -AdministratorLoginPassword $password -SslEnforcement Disabled -MinimalTlsVersion 'TLS1_2' -Sku GP_Gen5_1

               } | Should -Throw "*disallowed by policy*"
            }
        }

        It "Should deny non-compliant SSL on MySQL database servers - TLS Version" -Tag "deny-mysql-http" {
            AzTest -ResourceGroup {
                param($ResourceGroup)

                $random = GenerateRandomString -Length 13
                $password = GenerateRandomString -Length 20  | ConvertTo-Securestring -AsPlainText -Force
                $name = "mysql-$Random" 

                # Deploying the compliant Application Gateway with WAF enabled
                {
                    New-AzMySqlServer -Name $name -ResourceGroupName $ResourceGroup.ResourceGroupName -Location "uksouth" -AdministratorUserName mysql_test -AdministratorLoginPassword $password -SslEnforcement 'Enabled' -MinimalTlsVersion 'TLS1_1' -Sku GP_Gen5_1

               } | Should -Throw "*disallowed by policy*"
            }
        }

        It "Should allow compliant SSL on MySQL database servers" -Tag "allow-mysql-http" {
            AzTest -ResourceGroup {
                param($ResourceGroup)

                $random = GenerateRandomString -Length 13
                $password = GenerateRandomString -Length 20  | ConvertTo-Securestring -AsPlainText -Force
                $name = "mysql-$Random" 

                # Deploying the compliant Application Gateway with WAF enabled
                {
                    New-AzMySqlServer -Name $name -ResourceGroupName $ResourceGroup.ResourceGroupName -Location "uksouth" -AdministratorUserName mysql_test -AdministratorLoginPassword $password -SslEnforcement 'Enabled' -MinimalTlsVersion 'TLS1_2' -Sku GP_Gen5_1

               } | Should -Not -Throw
            }
        }
    }

    AfterAll {
        Remove-AzPolicyAssignment -Name "TDeny-MySql-http" -Scope $mangementGroupScope -Confirm:$false
    }
}
