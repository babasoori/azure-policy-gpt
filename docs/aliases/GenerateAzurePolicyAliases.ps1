# Script Name: GenerateAllAzureAliases.ps1
# Description: Retrieves all Azure resource aliases across all namespaces and generates a markdown file.

# Step 1: Connect to your Azure account
# Uncomment the line below to connect to your Azure account
# Connect-AzAccount

# Step 2: Get all namespaces
$namespaces = az provider list --query "[].namespace" -o tsv

# Step 3: Initialize markdown content
$mdContent = "# Azure Resource Aliases (All Namespaces)`n`n"

# Step 4: Loop through each namespace and retrieve aliases
foreach ($namespace in $namespaces) {
    Write-Host "Retrieving aliases for namespace: $namespace"
    
    # Retrieve aliases for the current namespace
    $aliases = az provider show --namespace $namespace --expand "resourceTypes/aliases" --query "resourceTypes[].aliases[].name" -o tsv

    if ($aliases) {
        $mdContent += "## $namespace`n`n"
        $mdContent += "| Alias Name |`n"
        $mdContent += "|------------|`n"

        foreach ($alias in $aliases) {
            $mdContent += "| $alias |`n"
        }
        $mdContent += "`n"
    }
}

# Step 5: Save the markdown content to a file
$outputFile = "AllAzureResourceAliases.md"
Write-Host "Saving markdown file to $outputFile..."
Set-Content -Path $outputFile -Value $mdContent -Encoding UTF8

Write-Host "Markdown file generation complete!"