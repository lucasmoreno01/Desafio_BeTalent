# Teste Técnico Mobile BeTalent
Projeto criado em **Flutter** para o teste técnico da BeTalent.
 Uma aplicação Flutter que permite a visualização, busca e gerenciamento de funcionários, integrando-se a uma API para exibição de informações.

📋 Sobre o Projeto
O projeto consiste em uma aplicação Flutter que exibe uma lista de funcionários com informações detalhadas, como nome, cargo, data de admissão e telefone. O programa inclui pesquisa em tempo real para facilitar a navegação pelos dados.

Funcionalidades Principais:
- Visualização de uma lista de funcionários com fotos e informações básicas.
- Detalhes expandidos de cada funcionário.
- Filtro de pesquisa para busca por nome.
- Integração com API RESTful para buscar dados dinâmicos.
- Provider para gerenciamento de estado e separação de lógica de negocios da interface
  
🛠️ Pré-requisitos
Para rodar o projeto é nescessário ter instalado em sua máquina:

- Flutter SDK
- Dart (geralmente instalado junto com o Flutter)
- Node para acessar a API
    - Instale o json-server caso não possua instalado: `npm install -g json-server`
    - Para o programa acessar os dados da API execute o comando `json-server --watch database.json` na pasta do arquivo `database.json`.
    - Certifique-se de que a API fornecendo os dados dos funcionários esteja ativa no endereço http://localhost:3000/employees

⚙️ Instruções para Rodar a Aplicação
<ol>
  <li> Clone o Repositório </li>
  <ul>
 <li>git clone https://github.com/seu-usuario/seu-repositorio.git</li>
 <li>cd seu-repositorio</li>
  </ul>
<li> Instale as Dependências </li>
  <ul>
        <li>No terminal, execute o comando: "flutter pub get" </li>
      </ul>
<li>Execute o programa em seu computador</li>
      <ul>
        <li>Por conta da API ficar sendo executada em um localhost a execução do programa precisa ser no mesmo dispositivo em que o servidor esta rodando.</li>
      </ul>
</ol>
