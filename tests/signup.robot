*** Settings ***
Documentation       Suite de testes de cadastro de dog walker
Resource    ../resources/base.resource
Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
Deve poder cadastrar um novo dog walker
    # ${name}    Set Variable    Bruno Avelar
    # ${email}    Set Variable    avelarb90@live.com
    # ${cpf}    Set Variable    00000014141
    # ${cep}    Set Variable    09061610
    # ${addressStreet}    Set Variable    Rua Tomás Fontes
    # ${addressDistrict}    Set Variable    Vila Palmares
    # ${addressCityUf}    Set Variable    Santo André/SP
    # ${numero}    Set Variable    99
    # ${complemento}    Set Variable    casa 3
    # ${cnh}    Set Variable    toretto.jpg
    [Tags]    smoke
    ${dog_walker}    Create Dictionary
    ...    name=Bruno Avelar
    ...    email=avelarb90@gmail.com
    ...    cpf=00000014141
    ...    cep=09061610
    ...    street=Rua Tomás Fontes
    ...    distrito=Vila Palmares
    ...    cidadeUf=Santo André/SP
    ...    numero=99
    ...    complemento=casa 3
    ...    cnh=toretto.jpg

    
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Pop-up should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    

Não deve cadastrar se os campos obrigatorios não forem preenchidos
    [Tags]    required   #robot -d ./logs -i required tests/signup.robot (-i serve para indicar e incluir a tag que eu quero executar )
   
 
    Go to signup page
    Submit signup form
    Alert Should be    Informe o seu nome completo
    Alert Should be    Informe o seu melhor email
    Alert Should be    Informe o seu CPF
    Alert Should be    Informe o seu CEP
    Alert Should be    Informe um número maior que zero
    Alert Should be    Adcione um documento com foto (RG ou CHN)
    
Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    care
    ${dog_walker}    Create Dictionary
    ...    name=Dominic Toretto
    ...    email=toretto@gmail.com
    ...    cpf=00000014141
    ...    cep=09061610
    ...    street=Rua Tomás Fontes
    ...    distrito=Vila Palmares
    ...    cidadeUf=Santo André/SP
    ...    numero=99
    ...    complemento=casa 3
    ...    cnh=toretto.jpg
    

    
    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Pop-up should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar de pets
    [Tags]    adestrar
    ${dog_walker}    Create Dictionary
    ...    name=Sonic Hedghog
    ...    email=sonic@gmail.com
    ...    cpf=00000014141
    ...    cep=09061610
    ...    street=Rua Tomás Fontes
    ...    distrito=Vila Palmares
    ...    cidadeUf=Santo André/SP
    ...    numero=99
    ...    complemento=casa 3
    ...    cnh=toretto.jpg


    
    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Pop-up should be    Recebemos o seu cadastro e em breve retornaremos o contato.