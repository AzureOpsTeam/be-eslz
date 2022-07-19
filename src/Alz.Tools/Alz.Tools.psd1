#!/usr/bin/pwsh

#
# Module manifest for module 'Alz.Tools'
#
# Generated by: krowlandson
#
# Generated on: 14/07/2022
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule           = 'Alz.Tools.psm1'

    # Version number of this module.
    ModuleVersion        = '1.0.0'

    # Supported PSEditions
    CompatiblePSEditions = 'Core', 'Desktop'

    # ID used to uniquely identify this module
    GUID                 = '2c90f23f-c69e-4819-81be-cf67450c2e39'

    # Author of this module
    Author               = 'krowlandson'

    # Company or vendor of this module
    CompanyName          = 'Microsoft Ltd'

    # Copyright statement for this module
    Copyright            = 'Copyright (c) 2022 Microsoft Ltd. All rights reserved.'

    # Description of the functionality provided by this module
    Description          = 'This module provides a set of functions used for managing the Azure landing zones code base.'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion    = '7.0'

    # Name of the PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # ClrVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules        = @(
        @{ModuleName = 'Alz.Enums'; ModuleVersion = '1.0.0'; GUID = 'bccc040b-857d-4ae8-bebf-31dd454e4855' }
        @{ModuleName = 'Alz.Classes'; ModuleVersion = '1.0.0'; GUID = '14f47ea8-53df-4b13-b7b4-73ecda225c0a' }
    )

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport    = @(
        'ConvertTo-ArmTemplateResource'
        'ConvertTo-LibraryArtifact'
        'Export-LibraryArtifact'
        'Invoke-UseCacheFromModule'
        'Invoke-UpdateCacheInModule'
        'Edit-LineEndings'
        'Add-Escaping'
        'Remove-Escaping'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport      = @()

    # Variables to export from this module
    VariablesToExport    = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport      = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    ModuleList           = @(
        'Alz.Enums'
        'Alz.Classes'
    )

    # List of all files packaged with this module
    FileList             = @(
        '.\Alz.Enum\Alz.Enum.psd1'
        '.\Alz.Enum\Alz.Enum.psm1'
        '.\Alz.Classes\Alz.Classes.psd1'
        '.\Alz.Classes\Alz.Classes.psm1'
        '.\functions\Alz.Tools.ps1'
        '.\Alz.Tools.psd1'
        '.\Alz.Tools.psm1'
    )

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            # RequireLicenseAcceptance = $false

            # External dependent modules of this module
            # ExternalModuleDependencies = @()

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}

