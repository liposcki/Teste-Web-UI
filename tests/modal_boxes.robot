*** Settings ***

Resource    ../resources/pages/modal_boxes_page.robot


*** Test Cases ***

CT01 - Navigation from the main menu to the W3Schools How To page
    Given the user accesses the W3schools website
    When click on the tutorials button in the main menu
    And click on the learn how to button
    Then the user must be directed to the W3Schools How To page

CT02 - Navigation from the secondary menu to the Modal Boxes page
    Given the user accesses the How To page
    When click on the Modal Boxes button in the side menu
    Then the user must be directed to the How TO - CSS/JS Modal page

CT03 - Opening the modal in the How To Create a Modal Box section
    Given the user accesses the How TO - CSS/JS Modal page
    When click on the Open Modal button in the How to Create a Modal Box section
    Then the modal must be displayed to the user
    And must contain the text Modals are awesome!

CT04 - Closing the modal in the How to create a modal box section by clicking the close button
    Given the user accesses the How TO - CSS/JS Modal page
    And the How To Create a Modal Box modal is open
    When click on the “X” button in the upper right corner
    Then the modal must be closed

CT05 - Closing the modal in the How To Create a Modal Box section by clicking outside the modal
    Given the user accesses the How TO - CSS/JS Modal page
    And the How To Create a Modal Box modal is open
    When click outside the modal area
    Then the modal must be closed