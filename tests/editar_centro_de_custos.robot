*** Settings ***
Test Setup    Abrir Navegador
Resource    ../Resource/editar_centro_de_custos.resource

*** Test Cases ***


CT01 - Salvar Cadastro
    Passo 1 - acessar pagina login QA Coders
    Passo 2 - Digitar Email QA Coders
    Passo 3 - Inserir Senha
    Passo 4 - Clicar Botão Entrar
    Passo 5 - Clicar em Cadastro
    Passo 6 - Clicar em Centro de Custo
    Passo 7 - Clicar Novo Cadastro
    Passo 8 - Cadastrar Centro de Custo
    Passo 9 - Clicar Botão Salvar Novo
    Passo 10 - Validação Centro de Custo Cadastrado
    Passo 11 - Validação de Mensagem Centro de Custo
    
CT02 - Validar campo obrigatório
    Passo 1 - Acessar página de login
    Paso 2 - Preencher campos de login
    Passo 3 - Clicar em Cadastro
    Passo 4 - Clicar em Novo Cadastro
    Passo 8 - Colocar nome em branco do centro de custos
    Passo 7 - Fechar Navegador
CT03 - Validar letras e números no campo de centro de custo
    Passo 1 - Acessar página de login
    Paso 2 - Preencher campos de login
    Passo 3 - Clicar em Cadastro
    Passo 4 - Clicar em Novo Cadastro
    Passo 9 - Validar letras e números no campo de centro de custo
    Passo 7 - Fechar Navegador

CT04 - Validar limite de 50 caracteres
    Passo 1 - Acessar página de login
    Paso 2 - Preencher campos de login
    Passo 3 - Clicar em Cadastro
    Passo 4 - Clicar em Novo Cadastro
    Passo 10 - Validar limite de 50 caracteres
    Passo 7 - Fechar Navegador