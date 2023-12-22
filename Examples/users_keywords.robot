*** Variables ***
${parent_path}    ""
${WEBSITE_LOGIN}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
the visitor is on "${website}"
    # Open browser
    Open Browser    ${website}

the visitor will connected
    # Check if not connected
    ${is_login_page}    Run Keyword And Return Status    Location Should Be    ${WEBSITE_LOGIN}
    Run Keyword If    ${is_login_page}    Login To Website
    # Waiting
    Sleep    2

the visitor is going to add user "${username}" with password "${password}"
    # Set parent path
    Set Global Variable    ${parent_path}    /html/body/div/div[1]/div[2]/div[2]/div/div/form
    # Set username
    Input Text    xpath=${parent_path}/div[1]/div/div[4]/div/div[2]/input    ${username}
    # Set password and confirm password
    Input Text    xpath=${parent_path}/div[2]/div/div[1]/div/div[2]/input    ${password}
    Input Text    xpath=${parent_path}/div[2]/div/div[2]/div/div[2]/input    ${password}
    # Set user role
    ${user_role_path}=    Set Variable    /div[1]/div/div[1]/div/div[2]/div 
    Click Element    xpath=${parent_path}${user_role_path}/div
    Wait Until Element Is Visible    xpath=${parent_path}${user_role_path}/div[2]/div[2]/span
    Click Element    xpath=${parent_path}${user_role_path}/div[2]/div[2]/span
    # Set status
    ${user_status_path}=    Set Variable    /div[1]/div/div[3]/div/div[2]/div
    Click Element    xpath=${parent_path}${user_status_path}/div
    Wait Until Element Is Visible    xpath=${parent_path}${user_status_path}/div[2]/div[2]
    Click Element    xpath=${parent_path}${user_status_path}/div[2]/div[2]
    # Set employee name
    ${employee_name_path}=    Set Variable    /html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div
    Input Text    xpath=${employee_name_path}/div/input    ${username} ${username} ${username}
    Wait Until Element Contains    xpath=${employee_name_path}/div[2]    ${username} ${username} ${username}
    Click Element    xpath=${employee_name_path}/div[2]

the visitor save the added user
    # Save user
    Click Element    xpath=//button[2]

the user added has been successfully
    Log To Console    L'utilisateur a été ajouté avec succès

the visitor is going to update user "${username}"
    # Set parent path
    Set Global Variable    ${parent_path}    /html/body/div/div[1]/div[2]/div[2]/div
    # Search user
    Wait Until Element Is Visible    xpath=${parent_path}/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input
    Input Text    xpath=${parent_path}/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    ${username}
    # Valid search user
    Sleep    1
    Wait Until Element Is Visible    xpath=${parent_path}/div[1]/div[2]/form/div[2]/button[2]
    Click Element    xpath=${parent_path}/div[1]/div[2]/form/div[2]/button[2]
    # Update user
    Sleep    1
    Wait Until Element Is Visible    xpath=${parent_path}/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]
    Click Element    xpath=${parent_path}/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]
    # # Update user role
    Wait Until Element Is Visible    xpath=${parent_path}/div/form/div[1]/div/div[1]/div/div[2]/div
    Click Element    xpath=${parent_path}/div/form/div[1]/div/div[1]/div/div[2]/div
    Sleep    0.5
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ARROW_DOWN
    Sleep    0.5    

the visitor save the updated user
    # Save update user
    Wait Until Element Is Visible    xpath=${parent_path}/div/form/div[2]/button[2]
    Click Element    xpath=${parent_path}/div/form/div[2]/button[2]

the user updated has been successfully
    Log To Console    L'utilisateur a été modifié avec succès

the visitor is going to delete user "${username}"
    # Set parent path
    ${parent_path}=    Set Variable    /html/body/div/div[1]/div[2]/div[2]/div
    # Search user
    Wait Until Element Is Visible    xpath=${parent_path}/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input
    Input Text    xpath=${parent_path}/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    ${username}
    # Valid search user
    Sleep    1
    Wait Until Element Is Visible    xpath=${parent_path}/div[1]/div[2]/form/div[2]/button[2]
    Click Element    xpath=${parent_path}/div[1]/div[2]/form/div[2]/button[2] 
    # Delete user
    Sleep    1
    Wait Until Element Is Visible    xpath=${parent_path}/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[1]
    Click Element    xpath=${parent_path}/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[1]

the visitor confirm the deleted user
    # Confirm delete user
    Wait Until Element Is Visible    xpath=/html/body/div/div[3]/div/div/div/div[3]/button[2]
    Click Element    xpath=/html/body/div/div[3]/div/div/div/div[3]/button[2]

the user deleted has been successfully
    Log To Console    L'utilisateur a été supprimé avec succès

the visitor is going to search user "${username}"
    # Set parent path
    Set Global Variable    ${parent_path}    /html/body/div/div[1]/div[2]/div[2]/div
    # Search user
    Wait Until Element Is Visible    xpath=${parent_path}/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input
    Input Text    xpath=${parent_path}/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    ${username}
    # Valid search user
    Sleep    1
    Wait Until Element Is Visible    xpath=${parent_path}/div[1]/div[2]/form/div[2]/button[2]
    Click Element    xpath=${parent_path}/div[1]/div[2]/form/div[2]/button[2]
    # Update user
    Sleep    1
    Wait Until Element Is Visible    xpath=${parent_path}/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]
    Click Element    xpath=${parent_path}/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]

the user has been find
    Log To Console    L'utilisateur a été trouvé avec succès

Login To Website
    Wait Until Element Is Visible    username
    Input Text    username    Admin
    Wait Until Element Is Visible    password
    Input Text    password    admin123
    Click Element    xpath=//button[1]

Logout To Website
    # Waiting
    Sleep    1
    # Click to profil
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[1]/header/div[1]/div[2]/ul/li/span
    Click Element    xpath=/html/body/div/div[1]/div[1]/header/div[1]/div[2]/ul/li/span
    # Waiting
    Sleep    1
    # Click to logout
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]
    Click Element    xpath=/html/body/div/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]