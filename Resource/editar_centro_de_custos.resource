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
${botão_novo_cadastro}    //button[@id='Novo Cadastro'] 
${url}    https://black-list-front.qacoders.dev.br/login
${email_QACoders}    sysadmin@qacoders.com
${senha_QACoders}    1234@Test
${inserir_email}    //*[@id="email"]
${inserir_senha}    //*[@id="password"]
${clicar_botão_login}   //button[normalize-space()='Entrar']
${clicar_cadastro}        //span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-yb0lig']
${clicar_CentroDeCusto}    //*[@id="Centro de Custo"]/span
${clicar_NovoCadastro}    //button[@id='Novo Cadastro']
${Cadastrar_CentroDeCusto}    //*[@id="costCentername"]
${clicar_botão_Salvar_Novo}    //*[@id="save"]

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
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Centro de Custo']    
    Click Element    xpath=//span[normalize-space()='Centro de Custo']
    Sleep    1s

Passo 4 - Clicar em Novo Cadastro
    Wait Until Element Is Visible    xpath=${botão_novo_cadastro} 
    Click Element    xpath=${botão_novo_cadastro}
    Sleep    1s


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
    Wait Until Page Contains    text=O campo 'centro de custos' só pode conter letras e o caractere especial '&'.
    Wait Until Page Contains Element    locator=//div[@class='MuiAlert-message css-1xsto0d']
    Sleep    1s

Passo 10 - Validar limite de 50 caracteres
    Input Text    id=costCentername   text=CentroCusto123456789012345678901234567890123456789012345
    Click Button    locator=//button[@id='save']
    Page Should Contain    O campo diretoria pode ter no máximo 50 caracteres

Passo 11 - Validar Salvar Centro de Custo
    Input Text    id=costCentername    ${centro_custo_valido}
    Click Button    locator=//button[@id='save']
    Page Should Contain    Centro de Custo atualizado com sucesso!


Passo 1 - acessar pagina login QA Coders
    Go To    url=${url}
 
Passo 2 - Digitar Email QA Coders
    Wait Until Element Is Visible    locator=${inserir_email}
    Input Text    locator=${inserir_email}    text=${email_QACoders}    
    Sleep    1s
 
Passo 3 - Inserir Senha
    Wait Until Element Is Visible    locator=${inserir_senha}
    Input Password    locator=${inserir_senha}    password=${senha_QACoders}
    Sleep    1s
 
Passo 4 - Clicar Botão Entrar
    Wait Until Element Is Visible    locator=${clicar_botão_login}
    Click Button    locator=${clicar_botão_login}
    Sleep    1s
 
Passo 5 - Clicar em Cadastro
    Wait Until Element Is Visible    locator=${clicar_cadastro}
    Click Element    locator=${clicar_cadastro}
    Sleep    1s
 
Passo 6 - Clicar em Centro de Custo
    Wait Until Element Is Visible    locator=${clicar_CentroDeCusto}
    Click Element    locator=${clicar_CentroDeCusto}
    Sleep    1s
 
Passo 7 - Clicar Novo Cadastro
    Wait Until Element Is Visible    locator=${clicar_NovoCadastro}
    Click Button    locator=${clicar_NovoCadastro}
    Sleep    1s
 
Passo 8 - Cadastrar Centro de Custo
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${FULL_NAME}             S${palavra_randomica}
    Log                     ${FULL_NAME}
    Wait Until Element Is Visible    locator=${Cadastrar_CentroDeCusto}
    Input Text    locator=${Cadastrar_CentroDeCusto}   text=${FULL_NAME}
    Sleep    1s
 
Passo 9 - Clicar Botão Salvar Novo
    Wait Until Element Is Visible    locator=${clicar_botão_Salvar_Novo}
    Click Button    locator=${clicar_botão_Salvar_Novo}
    Sleep    1s
 
Passo 10 - Validação Centro de Custo Cadastrado
    Wait Until Element Is Visible    locator=${clicar_novo_cadastro}
    Click Button    locator=${clicar_novo_cadastro}\
    Wait Until Element Is Visible    locator=${Cadastrar_CentroDeCusto}
    Input Text    locator=${Cadastrar_CentroDeCusto}    text=Slvhvqltu
    Wait Until Element Is Visible    locator=${clicar_botão_salvarNovo}
    Click Button    locator=${clicar_botão_salvarNovo}
    Sleep    1s
 
Passo 11 - Validação de Mensagem Centro de Custo
    Wait Until Page Contains    text=Não é possível salvar esse registro. Centro de custos já cadastrado no sistema.
    Wait Until Page Contains Element    locator=//div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Não é possível salvar esse registro. Centro de custos já cadastrado no sistema.')]
    Sleep    1s
 