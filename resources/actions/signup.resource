*** Settings ***
Documentation        Ações, steps e elementos da funcionalidade de cadastro
#Custom Action da pagina de Cadastro
#A diferença entre Page Objects e Custom Action é que no page vc faz o encapsulamento e a organização por paginas e no Custom vc faz por funcionalidades
Library    Browser
*** Keywords ***

Go to signup page
    
    Click    css=a[href="/signup"]
    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}    
    Fill Text    css=input[type=text][placeholder="Nome completo"]    ${dog_walker}[name]
    Fill Text    css=input[name=email]                                ${dog_walker}[email]
    Fill Text    css=input[placeholder^=CPF]                          ${dog_walker}[cpf] 
    Fill Text    css=input[name=cep]                                  ${dog_walker}[cep]

    Click    css=input[value="Buscar CEP"]

    Get Property    css=input[name=addressStreet]      value    equal    ${dog_walker}[street]
    Get Property    css=input[name=addressDistrict]    value    equal    ${dog_walker}[distrito]
    Get Property    css=input[name=addressCityUf]      value    equal    ${dog_walker}[cidadeUf]

    Fill Text    css=input[placeholder=Número]             ${dog_walker}[numero]
    Fill Text    css=input[placeholder=Complemento]        ${dog_walker}[complemento]

   
    Upload File By Selector    css=input[type=file]        ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Additional Service
    [Arguments]        ${additional_service}
    Click        xpath=//span[text()="${additional_service}"]/..     #/.. pula para o elemento de cima 
    Take Screenshot    selector=xpath=//span[text()="${additional_service}"]/..   #tira screenshot de um elemento especifico
    

Submit signup form
    Click    css=.button-register

Pop-up should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text    css=.swal2-html-container    equal    ${expected_text}

Alert Should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...    visible    5
    
