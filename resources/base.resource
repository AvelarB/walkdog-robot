*** Settings ***
Documentation        Arquivo principal do projeto
Library    Browser
Resource    actions/signup.resource


*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False     #pode ser executado em qualquer navegador sem instalar nenhum driver 
    New Page    https://walkdog.vercel.app/

    Wait For Elements State        css=h1 >> text=Cuidado e diversão em cada passo
    ...    visible    5
Finish Session
    Take Screenshot    fullPage=True
