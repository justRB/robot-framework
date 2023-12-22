*** Settings ***
Library     SeleniumLibrary
Resource    employees_keywords.robot

*** Variables ***

${LOGIN}    Admin
${PWD}      admin123
${usernameInput}    Franck
${firstname}    Franck
${lastname}     framck
${passwordInput}    Frite49300
${confirmpasswordInput}     Frite49300
${newName}    Fritesss

*** Test Cases ***
My Fisrt Playwright Robot Test
    [Tags]    employees
    # Step 1 : aller sur le site https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    the visitor is on "https://opensource-demo.orangehrmlive.com/web/index.php/auth/login" with playwright
    # Step 2 : se connecter au compte Admin
    employees_keywords.The Visitor Logs In To His Account
    # Step 3 : Cliquer sur l'onglet PIM du menu
    click on PIM for seing employees
    # Step 4 : créer un nouvel employé
    create a new employee
    # Step 5 : Modifier un employé
    edit an employee
    # Step 5 : Supprimer un employé
    delete an employee
    # se déconnecter
    logout
