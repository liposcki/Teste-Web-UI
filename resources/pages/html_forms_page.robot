*** Settings ***

Resource    ../common_resources.robot
Resource    ./modal_boxes_page.robot

Library    String


*** Variables ***

#URL
${URL_HTML_TUTORIAL}              ${URL}/html/default.asp
${URL_HTML_FORMS}                 ${URL}/html/html_forms.asp
${URL_TRY_HTML_FORM}              ${URL}/html/tryit.asp?filename=tryhtml_form_submit

#CTA
${BUTTON_LEARN_HTML}              //a[@title="HTML Tutorial"]/span/parent::a
${BUTTON_HTML_FORMS}              //a[contains(text(),"HTML Forms")]
${BUTTON_TRY_YOURSELF}            //label[contains(text(),"First name:")]/../../..//a
${BUTTON_TRY_YOURSELF_SUBMIT}     type:submit
${BUTTON_FORM_SUBMIT}             iframe[name="iframeResult"] >>> //input[@type="submit"]

${INPUT_TRY_YOURSELF_FNAME}       iframe[name="iframeResult"] >>> id=fname
${INPUT_TRY_YOURSELF_LNAME}       iframe[name="iframeResult"] >>> id=lname


#Verify
${PAGE_TITLE_HTML_TUTORIAL}       HTML Tutorial
${PAGE_TITLE_HTML_FORMS}          HTML Forms
${PAGE_TITLE_TRY_YOURSELF}        W3Schools Tryit Editor

${CONTENT_TITLE_HTML_TUTORIAL}    //h1[contains(text(),"HTML")]/span[contains(text(),"Tutorial")]
${CONTENT_TITLE_HTML_FORMS}       //h1[contains(text(),"HTML")]/span[contains(text(),"Forms")]
${CONTENT_TITLE_TRY_YOURSELF}     //li[contains(text(),"Tryit: HTML form element")]
${CONTENT_FORM_RETURN}            iframe[name="iframeResult"] >>> //div[contains(text(),"fname=$FNAME&lname=$LNAME")]

#Content
${TEXT_TITLE_HTML_TUTORIAL}       Tutorial
${TEXT_TITLE_HTML_FORMS}          Forms
${TEXT_TITLE_TRY_YOURSELF}        Tryit: HTML form element
${TEXT_FORM_FNAME}                Edu
${TEXT_FORM_LNAME}                Liposcki
${TEXT_FORM_VERIFY}               fname=$FNAME&lname=$LNAME


*** Keywords ***

#CT09
click on the Learn HTML To button
    Click    ${BUTTON_LEARN_HTML}    left


the user must be directed to the W3Schools HTML Tutorial page
    Wait For Condition    url         should end with                   ${URL_HTML_TUTORIAL}
    Wait For Condition    title       should start with                 ${PAGE_TITLE_HTML_TUTORIAL}
    Wait For Condition    text        ${CONTENT_TITLE_HTML_TUTORIAL}
    ...                   contains    ${TEXT_TITLE_HTML_TUTORIAL}

#CT10
the user accesses the HTML Tutorial page
    the user accesses the W3schools website
    click on the Tutorials button in the main menu
    click on the Learn HTML To button
    the user must be directed to the W3Schools HTML Tutorial page


click on the HTML Forms button in the side menu
    Click    ${BUTTON_HTML_FORMS}    left


the user must be directed to the HTML Forms page
    Wait For Condition    url         should end with                ${URL_HTML_FORMS}
    Wait For Condition    title       should start with              ${PAGE_TITLE_HTML_FORMS}
    Wait For Condition    text        ${CONTENT_TITLE_HTML_FORMS}
    ...                   contains    ${TEXT_TITLE_HTML_FORMS}


#CT11
the user accesses the HTML Forms page
    the user accesses the HTML Tutorial page
    click on the HTML Forms button in the side menu
    the user must be directed to the HTML Forms page


click on the Try it Yourself button in the side menu
    Click    ${BUTTON_TRY_YOURSELF}    left

    Close Page    CURRENT


the user must be directed to a new tab with HTML Forms
    #Switch Page    NEW
    Wait For Condition    url         should end with                  ${URL_TRY_HTML_FORM}
    Wait For Condition    title       should start with                ${PAGE_TITLE_TRY_YOURSELF}
    Wait For Condition    text        ${CONTENT_TITLE_TRY_YOURSELF}
    ...                   contains    ${TEXT_TITLE_TRY_YOURSELF}

#CT12
the user accesses Try it Yourself on the HTML Forms page
    the user accesses the HTML Forms page
    click on the Try it Yourself button in the side menu
    the user must be directed to a new tab with HTML Forms

the user fills in First Name and Last Name
    Fill Text    ${INPUT_TRY_YOURSELF_FNAME}    ${TEXT_FORM_FNAME}
    Fill Text    ${INPUT_TRY_YOURSELF_LNAME}    ${TEXT_FORM_LNAME}

click on the Submit button
    Click        ${BUTTON_FORM_SUBMIT}    left

the server must receive the First Name and Last Name filled in correctly
    ${TEMP_LOCATOR_FORM_RETURN} =    Replace String    ${CONTENT_FORM_RETURN}         $FNAME    ${TEXT_FORM_FNAME}
    ${TEMP_LOCATOR_FORM_RETURN} =    Replace String    ${TEMP_LOCATOR_FORM_RETURN}    $LNAME    ${TEXT_FORM_LNAME}
    
    ${TEMP_TEXT_FORM_VERIFY} =    Replace String    ${TEXT_FORM_VERIFY}         $FNAME    ${TEXT_FORM_FNAME}
    ${TEMP_TEXT_FORM_VERIFY} =    Replace String    ${TEMP_TEXT_FORM_VERIFY}    $LNAME    ${TEXT_FORM_LNAME}
    
    Wait For Condition    text        ${TEMP_LOCATOR_FORM_RETURN}
    ...                   contains    ${TEMP_TEXT_FORM_VERIFY}
