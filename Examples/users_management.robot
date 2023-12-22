*** Settings ***
Library     SeleniumLibrary
Resource    users_keywords.robot

*** Variables ***
${WEBSITE_ADD_USER}    https://opensource-demo.orangehrmlive.com/web/index.php/admin/saveSystemUser
${WEBSITE_VIEW_USER}    https://opensource-demo.orangehrmlive.com/web/index.php/admin/viewSystemUsers
${username}    JeanLouis
${password}    MySecret123Password

*** Test Cases ***
My Test To Add User
    [Tags]    add_user
    Given the visitor is on "${WEBSITE_ADD_USER}"
    And the visitor will connected
    When the visitor is going to add user "${username}" with password "${password}"
    And the visitor save the added user
    And Sleep    3
    And Close Browser
    Then the user added has been successfully

My Test To Search User
    [Tags]    search_user
    Given the visitor is on "${WEBSITE_VIEW_USER}"
    And the visitor will connected
    When the visitor is going to search user "${username}"
    And Sleep    3
    And Close Browser
    Then the user has been find

My Test To Update User
    [Tags]    update_user   
    Given the visitor is on "${WEBSITE_VIEW_USER}"
    And the visitor will connected
    When the visitor is going to update user "${username}"
    And the visitor save the updated user
    And Sleep    3
    And Close Browser
    Then the user updated has been successfully
                               
My Test To Delete User
    [Tags]    delete_user
    Given the visitor is on "${WEBSITE_VIEW_USER}"
    And the visitor will connected
    When the visitor is going to delete user "${username}"
    And the visitor confirm the deleted user
    And Sleep    3
    And Close Browser
    Then the user deleted has been successfully

My Test To Disconnect Visitor
    [Tags]    disconnect_visitor
    Logout To Website

My Full Test User
    [Tags]    full_user
    # Le visiteur va sur le site
    Given the visitor is on "${WEBSITE_ADD_USER}"
    # Le visiteur se connecte
    And the visitor will connected
    # le visiteur ajoute un utilisateur
    When the visitor is going to add user "${username}" with password "${password}"
    And the visitor save the added user
    And Sleep    5
    # le visiteur recherche et met à jour l'utilisateur recherché juste avant
    And Go To    ${WEBSITE_VIEW_USER}
    And the visitor is going to update user "${username}"
    And the visitor save the updated user
    And Sleep    5
    # Le visiteur supprime l'utilisateur
    And Go To    ${WEBSITE_VIEW_USER}
    And the visitor is going to delete user "${username}"
    And the visitor confirm the deleted user
    And Sleep    5
    # le visiteur se déconnecte
    And Logout To Website
    # le visiteur doit bien être sur la page de connexion
    And Location Should Be    ${WEBSITE_LOGIN}
    And Sleep    3
    And Close Browser
    Then Log To Console    Le test a réussi