*** Settings ***

Resource    ../resources/common_resources.robot
Resource    ../resources/pages/color_groups_page.robot


*** Test Cases ***

CT06 - Navigation from the main menu to the Colors Tutorial page
    Given the user accesses the W3schools website
    When click on the Tutorials button in the main menu
    And click on the Learn Colors button
    Then the user must be directed to the Colors Tutorial page

CT07 - Navigation from the secondary menu to the HTML Color Groups page
    Given the user accesses the Colors Tutorial page
    When click on the Color Groups button in the side menu
    Then the user must be directed to the HTML Color Groups page

CT08 - Checking colors in the tables on the HTML Color Groups page
    Given the user accesses the HTML Color Groups page
    When has the relationship of colors and hexadecimals
    Then colors must be the same hexadecimal in the table
    [Documentation]    Relation between colors and hexadecimals
    ...    | Black      | #000000 |
    ...    | Maroon     | #800000 |
    ...    | Gold       | #FFD700 |
    ...    | Cyan       | #00FFFF |
    ...    | Blue       | #0000FF |
    ...    | Silver     | #C0C0C0 |
    ...    | BlueViolet | #8A2BE2 |