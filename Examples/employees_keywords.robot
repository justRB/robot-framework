*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

the visitor is on "${url}" with playwright
    SeleniumLibrary.Open Browser    ${url}    chrome

the visitor logs in to his account
    Wait Until Page Contains Element    //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]
    Input Text  username    ${LOGIN}
    Input Text  password    ${PWD}
    Click Button    //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]

click on PIM for seing employees
    Wait Until Page Contains Element    xpath=/html/body/div[1]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a
    Click Element    xpath=/html/body/div[1]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a

create a new employee
    Wait Until Page Contains Element  xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    Wait Until Page Contains Element  xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[2]/button[2]
    Input Text  firstName   ${firstname}
    Input Text  lastName    ${lastname}
    Click Element   xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[2]/div/label/span
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/input
    Input Text  xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[3]/div/div[1]/div/div[2]/input  ${usernameInput}
    Input Text  xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[1]/div/div[2]/input  ${passwordInput}
    Input Text  xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/input  ${confirmpasswordInput}
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/form/div[2]/button[2]
    Sleep   5s

edit an employee
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a
    Click Element    xpath=/html/body/div[1]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div[2]/div[3]/button
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div[2]/div[3]/button
    Sleep   5s
    Input Text    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/div/div/input  ${firstname} ${lastname}
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div/div/div/div/div[1]/div[2]/div/div/button[2]
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div/div/div/div/div[1]/div[2]/div/div/button[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[5]/button
    Input Text    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[1]/div[1]/div/div/div[2]/div[1]/div[2]/input  ${newName}
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[5]/button
    
delete an employee
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a
    Click Element    xpath=/html/body/div[1]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div[2]/div[3]/button
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div[2]/div[3]/button
    Sleep   5s
    Input Text    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/div/div/input  ${firstname}${newName}
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div/div/div/div/div[1]/div[2]/div/div/button[1]
    Click Button    xpath=/html/body/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div/div/div/div/div[1]/div[2]/div/div/button[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[3]/div/div/div/div[3]/button[2]
    Click Button    xpath=/html/body/div[1]/div[3]/div/div/div/div[3]/button[2]

logout
    Click Element   xpath=/html/body/div[1]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]/a
    Click Element   xpath=/html/body/div[1]/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]/a