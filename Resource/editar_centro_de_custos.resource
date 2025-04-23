*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://black-list-front.qacoders.dev.br/login
${email}    sysadmin@qacoders.com
${senha}    1234@Test
${centro_custo}        Novo Centro de Custo
${diretoria}           JJJJJ
${centro_custo_valido_50}    CentroCusto12345678901234567890123456789012345678901234
${centro_custo_valido}    CentroCustoValid


*** Keywords ***
Abrir Navegador
    Open Browser    browser=headlessfirefox
    Maximize Browser Window    #aumentar tela
Fechar Navegador
    Close Browser

Passo 1 - Acessar página de login
    Go To    url=${URL}

Paso 2 - Preencher campos de login
    Input Text    id=email    ${email}
    Input Text    id=password    ${senha}
    Click Button    xpath=//button[text()='Entrar']

Passo 3 - Clicar em Cadastro
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Cadastros']    timeout=10s  # Primeiro, clicar em "Cadastros" para abrir o menu
    Click Element    xpath=//span[normalize-space()='Cadastros']
    Sleep    1s  # Dá um tempo para o menu abrir
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Centro de Custo']    timeout=10s
    Click Element    xpath=//span[normalize-space()='Centro de Custo']
    Sleep    1s

Passo 4 - Clicar em Novo Cadastro
    Wait Until Element Is Visible    locator=//button[@id='Novo Cadastro']    timeout=10s
    Click Element    locator=//button[@id='Novo Cadastro']


Passo 5 - Preencher Formulario de Cadastro
    ${palavra_randomica}    Generate Random String    length=10    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${CENTROCUSTONOME}        ${palavra_randomica}  
    Log                     ${CENTROCUSTONOME}
    Input Text    id=costCentername    ${CENTROCUSTONOME}  

Passo 6 - Salvar Cadastro
    Click Button    locator=//button[@id='save']
Passo 6.1 - Validação de Mensagem
    Passo 4 - Clicar em Novo Cadastro
    Input Text    id=costCentername    pop
    Passo 6 - Salvar Cadastro
    Wait Until Element Is Visible    //div[@class='MuiAlert-message css-1xsto0d']
    Wait Until Page Contains    Não é possível salvar esse registro. Centro de custos já cadastrado no sistema.

Passo 7 - Fechar Navegador
    Close Browser

Passo 8 - Colocar nome em branco do centro de custos
    Input Text    id=costCentername    ${EMPTY}
    Click Button    locator=//button[@id='save']
    Page Should Contain    O campo diretoria é obrigatório

Passo 9 - Validar letras e números no campo de centro de custo
    Input Text    id=costCentername    text=123abc
    Click Button    locator=//button[@id='save']
    Page Should Contain    O campo 'centro de custos' só pode conter letras e o caractere especial '&'.

Passo 10 - Validar limite de 50 caracteres
    Input Text    id=costCentername   text=CentroCusto123456789012345678901234567890123456789012345
    Click Button    locator=//button[@id='save']
    Page Should Contain    O campo diretoria pode ter no máximo 50 caracteres

Passo 11 - Validar Salvar Centro de Custo
    Input Text    id=costCentername    ${centro_custo_valido}
    Click Button    locator=//button[@id='save']
    Page Should Contain    Centro de Custo atualizado com sucesso!