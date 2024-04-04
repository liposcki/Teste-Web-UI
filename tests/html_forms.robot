*** Settings ***

Resource    ../resources/pages/html_forms_page.robot


*** Test Cases ***

CT09 - Navigation from the main menu to the HTML Tutorial page
    Given the user accesses the W3schools website
    When click on the Tutorials button in the main menu
    And click on the Learn HTML To button
    Then the user must be directed to the W3Schools HTML Tutorial page

CT10 - Secondary menu navigation to the HTML Forms page
    Given the user accesses the HTML Tutorial page
    When click on the HTML Forms button in the side menu
    Then the user must be directed to the HTML Forms page

CT11 - Access the Try it Yourself page
    Given the user accesses the HTML Forms page
    When click on the Try it Yourself button in the side menu
    Then the user must be directed to a new tab with HTML Forms

CT12 - Submit the HTML Forms form with data filled out correctly.
    Given the user accesses Try it Yourself on the HTML Forms page
    When the user fills in First Name and Last Name
    And click on the Submit button
    Then the server must receive the First Name and Last Name filled in correctly