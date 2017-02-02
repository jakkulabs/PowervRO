# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $JSON.Connection.Password -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Tests
Describe -Name 'Workflow Tests' -Fixture {

    It -Name "Return named Workflow by Id $($JSON.Workflow.IdNoParameter)" -Test {

        $WorkflowA = Get-vROWorkflow -Id $JSON.Workflow.IdNoParameter
        $WorkflowA.ID | Should Be $JSON.Workflow.IdNoParameter
    }

    It -Name "Return named Workflow by Name $($JSON.Workflow.NameNoParameter)" -Test {

        $WorkflowB = Get-vROWorkflow -Name $JSON.Workflow.NameNoParameter
        $WorkflowB.Name | Should Be $JSON.Workflow.NameNoParameter
    }

    It -Name "Return named Workflows by Wildcard $($JSON.Workflow.NameWildcard)" -Test {

        $WorkflowsC = Get-vROWorkflow -Name $JSON.Workflow.NameWildcard -Wildcard
        
        foreach ($Workflow in $WorkflowsC){

            $Workflow.Name | Should Match $JSON.Workflow.NameWildcard
        }
    }

    It -Name "Create named Workflow Permissions by Workflow Id $($JSON.Workflow.IdNoParameter)" -Test {

        $WorkflowPermissionsA = Get-vROWorkflow -Id $JSON.Workflow.IdNoParameter | Add-vROWorkflowPermission -Principal $JSON.Workflow.PermissionsPrincipal -Rights $JSON.Workflow.PermissionsRights
        $WorkflowPermissionsA.Principal | Should Be $JSON.Workflow.PermissionsPrincipal
    }

    It -Name "Return named Workflow Permissions by Workflow Id $($JSON.Workflow.IdNoParameter)" -Test {

        $WorkflowPermissionsB = Get-vROWorkflowPermission -Id $JSON.Workflow.IdNoParameter
        $WorkflowPermissionsB.Principal | Should Be $JSON.Workflow.PermissionsPrincipal
    }

    It -Name "Return named Workflow Permissions by Pipeline f0r Workflow $($JSON.Workflow.NameNoParameter)" -Test {

        $WorkflowPermissionsC = Get-vROWorkflow -Name $JSON.Workflow.NameNoParameter | Get-vROWorkflowPermission
        $WorkflowPermissionsC.Principal | Should Be $JSON.Workflow.PermissionsPrincipal
    }

    It -Name "Remove named Workflow Permissions by Workflow Id $($JSON.Workflow.IdNoParameter)" -Test {

        Get-vROWorkflow -Id $JSON.Workflow.IdNoParameter | Remove-vROWorkflowPermission -Principal $JSON.Workflow.PermissionsPrincipal -Confirm:$false
        $WorkflowPermissionsD = Get-vROWorkflowPermission -Id $JSON.Workflow.IdNoParameter | Where-Object {$_.Principal -eq $JSON.Workflow.PermissionsPrincipal}
        $WorkflowPermissionsD | Should Be $null
    }

    It -Name "Export named Workflow Schema by Workflow Id $($JSON.Workflow.IdNoParameter)" -Test {

        $SchemaA = Export-vROWorkflowSchema -Id $JSON.Workflow.IdNoParameter -File $JSON.Workflow.SchemaOutputFile
        $SchemaA.FullName | Should Be $JSON.Workflow.SchemaOutputFile
    }

    It -Name "Export named Workflow Schema by Pipeline f0r Workflow $($JSON.Workflow.NameNoParameter)" -Test {

        $SchemaB = Get-vROWorkflow -Name $JSON.Workflow.NameNoParameter | Export-vROWorkflowSchema -File $JSON.Workflow.SchemaOutputFile
        $SchemaB.FullName | Should Be $JSON.Workflow.SchemaOutputFile
    }

    It -Name "Export named Workflow Icon by Workflow Id $($JSON.Workflow.IdNoParameter)" -Test {

        $IconA = Export-vROWorkflowSchema -Id $JSON.Workflow.IdNoParameter -File $JSON.Workflow.IconOutputFile
        $IconA.FullName | Should Be $JSON.Workflow.IconOutputFile
    }

    It -Name "Export named Workflow Icon by Pipeline f0r Workflow $($JSON.Workflow.NameNoParameter)" -Test {

        $IconB = Get-vROWorkflow -Name $JSON.Workflow.NameNoParameter | Export-vROWorkflowSchema -File $JSON.Workflow.IconOutputFile
        $IconB.FullName | Should Be $JSON.Workflow.IconOutputFile
    }

    It -Name "Export named Workflow by Id $($JSON.Workflow.IdNoParameter)" -Test {

        $ExportedWorkflowA = Export-vROWorkflow -Id $JSON.Workflow.IdNoParameter -File $JSON.Workflow.WorkflowOutputFile
        $ExportedWorkflowA.FullName | Should Be $JSON.Workflow.WorkflowOutputFile
    }

    It -Name "Export named Workflow by Pipeline f0r Workflow $($JSON.Workflow.NameNoParameter)" -Test {

        $ExportedWorkflowB = Get-vROWorkflow -Name $JSON.Workflow.NameNoParameter | Export-vROWorkflow -File $JSON.Workflow.WorkflowOutputFile
        $ExportedWorkflowB.FullName | Should Be $JSON.Workflow.WorkflowOutputFile
    }

    It -Name "Remove named Workflow by Workflow Id $($JSON.Workflow.IdNoParameter)" -Test {

        Remove-vROWorkflow -Id $JSON.Workflow.IdNoParameter -Confirm:$false
        try {

            $WorkflowD = Get-vROWorkflow -Id $JSON.Workflow.IdNoParameter
        }
        catch [Exception]{

        }
        $WorkflowD | Should Be $null
    }

    It -Name "Import named Workflow by Id $($JSON.Workflow.IdNoParameter)" -Test {

        $ImportedWorkflowA = Import-vROWorkflow -CategoryId $JSON.Category.PowervROTestId -File $JSON.Workflow.WorkflowOutputFile -PassThru -Confirm:$false
        $ImportedWorkflowA.Id | Should Be $JSON.Workflow.IdNoParameter
    }
}

# --- Cleanup
Disconnect-vROServer -Confirm:$false