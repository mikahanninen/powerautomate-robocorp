*** Settings ***
Library           RPA.Robocorp.WorkItems
Library           SharepointLibrary

*** Keywords ***
Handle Issue
    ${mail}=    Get Work Item Variable    email
    &{issue}=    Get Sharepoint Issue From Email Body    ${mail}[text]
    Log To Console    issue: ${issue}
    FOR    ${key}    IN    @{issue.keys()}
        Log    ${key}: ${issue}[${key}]
    END

*** Tasks ***
Power Automating
    For Each Input Work Item    Handle Issue
