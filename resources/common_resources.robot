*** Settings ***

Library    Browser    #library responsável por implementar o playwright ao robot.


*** Variables ***

#Configurações
${BROWSER}     chromium    #Define em qual motor o teste será realizado (chromium, firefox, webkit)
${HEADLESS}    ${False}    #Para visualizar o processo de teste deixar o "headless" = false, caso não "true".

#URL
${URL}         https://www.w3schools.com


*** Keywords ***

Open Browser

    [Arguments]    ${URL}
    
    New Browser    ${BROWSER}    ${HEADLESS}
    New Context    viewport={"width": 1366, "height": 810}
    New Page       ${URL}
    Set Browser Timeout    timeout=30