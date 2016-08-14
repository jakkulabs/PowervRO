# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $JSON.Connection.Password -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Tests
Describe -Name 'Workflow Execution Tests' -Fixture {

    It -Name "Create named Parameter Definition $($JSON.Workflow.ParameterDefinitionName)" -Test {

        $ParameterDefinitionNameA = New-vROParameterDefinition -Name $JSON.Workflow.ParameterDefinitionName -Value $JSON.Workflow.ParameterDefinitionValue -Type $JSON.Workflow.ParameterDefinitionType -Scope $JSON.Workflow.ParameterDefinitionScope
        $ParameterDefinitionNameA.Name | Should Be $JSON.Workflow.ParameterDefinitionName
    }

    It -Name "Invoke named Workflow with no parameters by ID $($JSON.Workflow.IDNoParameter)" -Test {

        $InvokeRequestA = Invoke-vROWorkflow -ID $JSON.Workflow.IDNoParameter
        $InvokeRequestA.StatusCode | Should Be $JSON.Workflow.StatusCode
    }

    It -Name "Invoke named Workflow with no parameters by Name $($JSON.Workflow.NameNoParameter)" -Test {

        $InvokeRequestB = Get-vROWorkflow -Name $JSON.Workflow.NameNoParameter | Invoke-vROWorkflow
        $InvokeRequestB.StatusCode | Should Be $JSON.Workflow.StatusCode
    }

    It -Name "Invoke named Workflow with one parameter by ID $($JSON.Workflow.IDOneParameter)" -Test {

        $InvokeRequestC = Invoke-vROWorkflow -ID $JSON.Workflow.IDOneParameter -ParameterName $JSON.Workflow.ParameterNameOneParameter -ParameterValue $JSON.Workflow.ParameterValueOneParameter -ParameterType $JSON.Workflow.ParameterTypeOneParameter
        $InvokeRequestC.StatusCode | Should Be $JSON.Workflow.StatusCode
    }

    It -Name "Invoke named Workflow with one parameter by Name $($JSON.Workflow.NameOneParameter)" -Test {

        $InvokeRequestD = Get-vROWorkflow -Name $JSON.Workflow.NameOneParameter | Invoke-vROWorkflow -ParameterName $JSON.Workflow.ParameterNameOneParameter -ParameterValue $JSON.Workflow.ParameterValueOneParameter -ParameterType $JSON.Workflow.ParameterTypeOneParameter
        $InvokeRequestD.StatusCode | Should Be $JSON.Workflow.StatusCode
    }

    It -Name "Invoke named Workflow with multiple parameters by ID $($JSON.Workflow.IDMultipleParameter)" -Test {

        $JSONData =  @"
{"parameters":
	[
        {
            "value": {"$($JSON.Workflow.ParameterTypeAMultipleParameter)":{ "value": "$($JSON.Workflow.ParameterValueAMultipleParameter)"}},
            "type": "$($JSON.Workflow.ParameterTypeAMultipleParameter)",
            "name": "$($JSON.Workflow.ParameterNameAMultipleParameter)",
            "scope": "local"
        },
        {
            "value": {"$($JSON.Workflow.ParameterTypeBMultipleParameter)":{ "value": $($JSON.Workflow.ParameterValueBMultipleParameter)}},
            "type": "$($JSON.Workflow.ParameterTypeBMultipleParameter)",
            "name": "$($JSON.Workflow.ParameterNameBMultipleParameter)",
            "scope": "local"
        }	
	]
}
"@
        $InvokeRequestE = Invoke-vROWorkflow -ID $JSON.Workflow.IDMultipleParameter -Parameters ($JSONData | ConvertFrom-Json).parameters
        $InvokeRequestE.StatusCode | Should Be $JSON.Workflow.StatusCode
    }

    It -Name "Invoke named Workflow with multiple parameters by Name $($JSON.Workflow.NameMultipleParameter)" -Test {

        $JSONData =  @"
{"parameters":
	[
        {
            "value": {"$($JSON.Workflow.ParameterTypeAMultipleParameter)":{ "value": "$($JSON.Workflow.ParameterValueAMultipleParameter)"}},
            "type": "$($JSON.Workflow.ParameterTypeAMultipleParameter)",
            "name": "$($JSON.Workflow.ParameterNameAMultipleParameter)",
            "scope": "local"
        },
        {
            "value": {"$($JSON.Workflow.ParameterTypeBMultipleParameter)":{ "value": $($JSON.Workflow.ParameterValueBMultipleParameter)}},
            "type": "$($JSON.Workflow.ParameterTypeBMultipleParameter)",
            "name": "$($JSON.Workflow.ParameterNameBMultipleParameter)",
            "scope": "local"
        }	
	]
}
"@
        $InvokeRequestF = Get-vROWorkflow -Name $JSON.Workflow.NameMultipleParameter | Invoke-vROWorkflow -Parameters ($JSONData | ConvertFrom-Json).parameters
        $InvokeRequestF.StatusCode | Should Be $JSON.Workflow.StatusCode
    }

    It -Name "Return named Workflow Executions by Id $($JSON.Workflow.IdNoParameter)" -Test {

        $ExecutionsA = Get-vROWorkflowExecution -Id $JSON.Workflow.IdNoParameter
        
        foreach ($Execution in $ExecutionsA){

            $Execution.Execution | Should Match $JSON.Workflow.IdNoParameter
        }
    }

    It -Name "Return named Workflow Executions by Name $($JSON.Workflow.NameNoParameter)" -Test {

        $ExecutionsB = Get-vROWorkflowExecution -Name $JSON.Workflow.NameNoParameter
        
        foreach ($Execution in $ExecutionsB){

            $Execution.Name | Should Be $JSON.Workflow.NameNoParameter
        }
    }

    It -Name "Return named Workflow Execution State by ExecutionStateRef $($JSON.Workflow.ExecutionStateRef)" -Test {

        $ExecutionStateA = Get-vROWorkflowExecutionState -ExecutionStateRef $JSON.Workflow.ExecutionStateRef
        $ExecutionStateA.ExecutionStateRef | Should Be $JSON.Workflow.ExecutionStateRef
    }

    It -Name "Return named Workflow Execution State by Execution Id $($JSON.Workflow.ExecutionId)" -Test {

        $ExecutionStateB = Get-vROWorkflowExecution -Id 3f92d2dc-a9fa-4323-900b-ef97196184ea | Select-Object -Last 1 | Get-vROWorkflowExecutionState
        $ExecutionStateB.ExecutionStateRef | Should BeOfType System.String
    }

    It -Name "Return named Workflow Execution Result by ExecutionRef $($JSON.Workflow.ExecutionResultRef)" -Test {

        $ExecutionResultA = Get-vROWorkflowExecutionResult -ExecutionRef $JSON.Workflow.ExecutionResultRef
        $ExecutionResultA.ExecutionRef | Should Be $JSON.Workflow.ExecutionResultRef
    }

    It -Name "Return named Workflow Execution Result by Workflow Name $($JSON.Workflow.ExecutionResultWorkflow)" -Test {

        $ExecutionResultB = Get-vROWorkflow -Name $JSON.Workflow.ExecutionResultWorkflow | Get-vROWorkflowExecution | Select -Last 1 | Get-vROWorkflowExecutionResult
        $ExecutionResultB.ExecutionRef | Should BeOfType System.String
    }
}

# --- Cleanup
Disconnect-vROServer -Confirm:$false