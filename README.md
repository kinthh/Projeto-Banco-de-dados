# Projeto-Banco-de-dados
O projeto visa criar e gerenciar um banco de dados para uma loja de CD's, permitindo o armazenamento e recuperação de informações sobre CDs, artistas, clientes, pedidos e outras entidades relacionadas ao funcionamento da loja.

Este projeto é baseado no curso "MySQL: Criando e Manipulando Banco de Dados" da IMPACTA.

Nota: Todos os dados sensíveis, incluindo informações de clientes, pedidos e quaisquer outros dados pessoais, são fictícios e foram criados apenas para fins de demonstração e prática.
![image](https://github.com/user-attachments/assets/bf9ed63c-c83d-490c-89ac-99e36d9cefde)

# Diagrama do Projeto
Este diagrama tem como objetivo facilitar a visualização dos campos relacionados no projeto de banco de dados para uma loja de CD's.

É possível observar que a tabela de pedidos é o principal campo, onde a partir dele se desdobra a relação com outras entidades essenciais, como clientes, títulos (CDs), e outras tabelas relacionadas aos pedidos.

Cada entidade está devidamente conectada, mostrando a integração entre os diferentes aspectos do funcionamento da loja. Por exemplo, os pedidos estão vinculados aos clientes que os fizeram e aos títulos_pedidos dos CDs solicitados em cada pedido.

Esse diagrama proporciona uma visão clara e organizada da estrutura do banco de dados, ajudando no desenvolvimento, manutenção e compreensão do sistema como um todo.]

# Entidades Principais
- CDs (Títulos): Esta entidade armazena informações sobre os CDs disponíveis na loja, incluindo título, preço, quantidade em estoque, gravadora associada e categoria do CD.
- Artistas: Registra os artistas associados aos CDs, permitindo a associação de múltiplos artistas a cada CD.
- Gravadoras: Armazena detalhes das gravadoras que produzem os CDs, permitindo o rastreamento dos CDs produzidos por cada gravadora.
- Categorias: Define as categorias ou gêneros dos CDs, ajudando na organização e classificação dos produtos na loja.
- Clientes: Mantém informações sobre os clientes da loja, como nome e endereço.
- Pedidos: Registra os pedidos feitos pelos clientes, incluindo os CDs solicitados, data do pedido e informações do cliente.
- Títulos Pedidos: Relaciona os CDs solicitados em cada pedido, permitindo o rastreamento dos CDs vendidos em cada transação.
