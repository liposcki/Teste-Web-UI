# Testes Web-UI

## W3schools

O W3Schools é um site de referência amplamente utilizado que oferece tutoriais, exemplos e documentação sobre várias tecnologias da web, como HTML, CSS, JavaScript, SQL, PHP, Python e muitas outras. Ele serve como uma plataforma educacional para desenvolvedores web de todos os níveis de habilidade, desde iniciantes até profissionais experientes, fornecendo recursos úteis para aprender e aprimorar suas habilidades de codificação.

## Estrutura de Diretórios

```
.
├── resources
│   ├── pages
│   │   ├── color_groups_page.robot         # Arquivo de Page Object para interação com elementos da página Color Groups.
│   │   ├── html_forms_page.robot           # Arquivo de Page Object para interação com elementos da página HTML Forms.
│   │   ├── modal_boxes_page.robot         # Arquivo de Page Object para interação com elementos da página Modal Boxes.
│   ├── common_resources.robot             # Arquivo contendo recursos comuns utilizados em vários testes.
├── tests
│   ├── color_groups.robot                # Arquivo de teste para validar funcionalidades relacionadas a página Color Groups.
│   ├── html_forms.robot                  # Arquivo de teste para validar funcionalidades relacionadas a página HTML Forms.
│   ├── modal_boxes.robot                 # Arquivo de teste para validar funcionalidades relacionadas a página Modal Boxes.
├── README.md                             # Este arquivo, fornecendo informações sobre o projeto.
├── package-lock.json                     # Arquivo de bloqueio para dependências do Node.js.
├── package.json                          # Arquivo de configuração do projeto Node.js.
├── requirements.txt                      # Arquivo contendo as dependências do Python.
```

## Requisitos de Instalação

Para configurar e executar este projeto, você precisará dos seguintes requisitos:

- **Python** acima da versão 3.8
- **Pip**: Gerenciador de pacotes do Python
- **Node.js** acima da versão 20
- **Npm**: Gerenciador de pacotes do Node.js
- **Robot Framework**: Framework de testes. Certifique-se de que ele seja adicionado ao PATH do sistema
- **IDE** de sua preferência para desenvolvimento e execução de testes

## Comandos para Configurar o Projeto

Para configurar o ambiente de desenvolvimento e preparar o projeto para execução, execute os seguintes comandos:

1. `pip install -r requirements.txt`: Instala todas as dependências do Python listadas no arquivo `requirements.txt`.
2. `npm install`: Instala todas as dependências do Node.js listadas no arquivo `package.json`.
3. `python3 -m Browser.entry init`: Inicializa o ambiente de teste do Browser.
4. `npx playwright install-deps`: Instala as dependências necessárias para o Playwright.

## Para Executar o Projeto

Para executar os testes do projeto, utilize o seguinte comando:

```
robot -d results tests
```

Este comando executará todos os testes presentes na pasta `tests` e gerará os resultados na pasta `results`.
