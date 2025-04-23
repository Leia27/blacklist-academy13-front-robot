*** Settings ***
Test Setup    Abrir Navegador
Resource    ../Resource/editar_centro_de_custos.resource

*** Test Cases ***


CT01 - Salvar Cadastro
    Passo 1 - Acessar página de login
    Paso 2 - Preencher campos de login
    Passo 3 - Clicar em Cadastro  # O teste só vai até aqui, porquee não tem o botão de editar
    Passo 4 - Clicar em Novo Cadastro
    Passo 5 - Preencher Formulario de Cadastro
    Passo 6 - Salvar Cadastro
    Passo 6.1 - Validação de Mensagem
    Passo 7 - Fechar Navegador
    
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