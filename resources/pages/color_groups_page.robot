*** Settings ***

Resource    ../common_resources.robot
Resource    ./modal_boxes_page.robot

Library    String


*** Variables ***

#URL
${URL_COLORS}                    ${URL}/colors/default.asp
${URL_COLOR_GROUPS}              ${URL}/colors/colors_groups.asp

#CTA
${BUTTON_LEARN_COLORS}           //div[@data-name="colors"]/a[1]
${BUTTON_COLOR_GROUPS}           //a[contains(text(),"Color Groups")]

#Locator
${TABLE_COLORS}                  //table
${HEX_LOCATOR}                   //table//td//a[text()="$COLORNAME"]/parent::td/parent::tr/td[2]/a

#Verify
${PAGE_TITLE_COLORS}             Colors Tutorial
${PAGE_TITLE_COLOR_GROUPS}       HTML Color Groups

${CONTENT_TITLE_COLORS}          //span[contains(text(),"Colors Tutorial")]
${CONTENT_TITLE_COLOR_GROUPS}    //h1[contains(text(),"HTML Color Groups")]

#Content
${TEXT_TITLE_COLORS}             Colors Tutorial
${TEXT_TITLE_COLOR_GROUPS}       HTML Color Groups


*** Keywords ***

#CT06
click on the Learn Colors button
    Click    ${BUTTON_LEARN_COLORS}    left

the user must be directed to the Colors Tutorial page
    Wait For Condition    url         should end with             ${URL_COLORS}
    Wait For Condition    title       should start with           ${PAGE_TITLE_COLORS}
    Wait For Condition    text        ${CONTENT_TITLE_COLORS}     
    ...                   contains    ${TEXT_TITLE_COLORS}

#CT07
the user accesses the Colors Tutorial page
    the user accesses the W3schools website
    click on the Tutorials button in the main menu
    click on the Learn Colors button
    the user must be directed to the Colors Tutorial page

click on the Color Groups button in the side menu
    Click    ${BUTTON_COLOR_GROUPS}    left

the user must be directed to the HTML Color Groups page
    Wait For Condition    url         should end with                  ${URL_COLOR_GROUPS}
    Wait For Condition    title       should start with                ${PAGE_TITLE_COLOR_GROUPS}
    Wait For Condition    text        ${CONTENT_TITLE_COLOR_GROUPS}
    ...                   contains    ${TEXT_TITLE_COLOR_GROUPS}

#CT08
the user accesses the HTML Color Groups page
    the user accesses the Colors Tutorial page
    click on the Color Groups button in the side menu
    the user must be directed to the HTML Color Groups page

has the relationship of colors and hexadecimals

    ${COLOR_HEX}    Create Dictionary
    ...             Black=\#000000
    ...             Maroon=\#800000
    ...             Gold=\#FFD700
    ...             Cyan=\#00FFFF
    ...             Blue=\#0000FF
    ...             Silver=\#C0C0C0
    ...             BlueViolet=\#8A2BE2

    Set Test Variable    ${COLOR_HEX}

colors must be the same hexadecimal in the table

    FOR    ${COLOR}    ${HEX}    IN    &{COLOR_HEX}

        ${HEX_LOCATOR_LOCAL} =    Replace String    ${HEX_LOCATOR}         $COLORNAME    ${COLOR}
        Wait For Condition        text              ${HEX_LOCATOR_LOCAL}   contains      ${HEX}

    END
