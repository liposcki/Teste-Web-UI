*** Settings ***

Resource    ../common_resources.robot


*** Variables ***

#URL
${URL_HOW_TO}              ${URL}/howto/default.asp
${URL_HOW_TO_MODAL}        ${URL}/howto/howto_css_modals.asp
 
#CTA 
${BUTTON_TUTORIAL}         id=navbtn_tutorials
${BUTTON_LEARN_HOW_TO}     //div[@data-name="how to"]/a[1]
${BUTTON_MODAL_BOXES}      //a[contains(text(),"Modal Boxes")]
${BUTTON_OPEN_MODAL}       //div/button[contains(text(),"Open Modal")]
${BUTTON_CLOSE_MODAL}      //header/span[contains(text(),"×")]

#Verify
${PAGE_TITLE_HOW_TO}       W3Schools How TO - Code snippets for HTML, CSS and JavaScript
${PAGE_TITLE_MODAL}        How To Make a Modal Box With CSS and JavaScript

${CONTENT_TITLE_HOW_TO}    //span[contains(text(),"How To")]
${CONTENT_TITLE_MODAL}     //h1[contains(text(),"How TO - CSS/JS Modal")]
${CONTENT_BODY_MODAL}      //p[contains(text(),"Modals are awesome!")]

${ELEMENT_MODAL}           //div[@class="w3-modal"]

#Content
${TEXT_TITLE_HOW_TO}       How To
${TEXT_TITLE_MODAL}        How TO - CSS/JS Modal
${TEXT_BODY_MODAL}         Modals are awesome!


*** Keywords ***

#CT01
the user accesses the W3schools website
    Open Browser    ${URL}

click on the Tutorials button in the main menu
    Click    ${BUTTON_TUTORIAL}    left

click on the Learn How To button
    Click    ${BUTTON_LEARN_HOW_TO}    left

the user must be directed to the W3Schools How To page
    Wait For Condition    url         should end with            ${URL_HOW_TO}
    Wait For Condition    title       should start with          ${PAGE_TITLE_HOW_TO}
    Wait For Condition    text        ${CONTENT_TITLE_HOW_TO}
    ...                   contains    ${TEXT_TITLE_HOW_TO}

#CT02
the user accesses the How To page
    the user accesses the W3schools website
    click on the Tutorials button in the main menu
    click on the Learn How To button
    the user must be directed to the W3Schools How To page

click on the Modal Boxes button in the side menu
    Click    ${BUTTON_MODAL_BOXES}    left

the user must be directed to the How TO - CSS/JS Modal page
    Wait For Condition    url         should end with           ${URL_HOW_TO_MODAL}
    Wait For Condition    title       should start with         ${PAGE_TITLE_MODAL}
    Wait For Condition    text        ${CONTENT_TITLE_MODAL}
    ...                   contains    ${TEXT_TITLE_MODAL}

#CT03
the user accesses the How TO - CSS/JS Modal page
    the user accesses the How To page
    click on the Modal Boxes button in the side menu
    the user must be directed to the How TO - CSS/JS Modal page

click on the Open Modal button in the How to Create a Modal Box section
    Click    ${BUTTON_OPEN_MODAL}    left

the modal must be displayed to the user
    Get Element States   ${ELEMENT_MODAL}    validate    value & visible 
    
must contain the text Modals are awesome!
    Wait For Condition    text        ${CONTENT_BODY_MODAL}
    ...                   contains    ${TEXT_BODY_MODAL}

#CT04
the How To Create a Modal Box modal is open
    click on the Open Modal button in the How to Create a Modal Box section

click on the “X” button in the upper right corner
    Click    ${BUTTON_CLOSE_MODAL}    left

the modal must be closed
    Get Element States   ${ELEMENT_MODAL}    validate    value & hidden

#CT05
click outside the modal area
    Click With Options    ${ELEMENT_MODAL}    left    position_x=-10