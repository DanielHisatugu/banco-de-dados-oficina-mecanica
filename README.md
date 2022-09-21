### <u>Projeto de Banco de Dados para uma Oficina Mecânica</u>

Modelamos um contexto reduzido de uma oficina mecânica como um segundo desafio do bootcamp Database Experience da [Digital Innovation One (DiO)](https://web.dio.me/track/database-experience) , utilizando a ferramenta MySQL Workbench e os conceitos de primary key e foreign key, criando um esquema conceitual para o cenário proposto.

#### Narrativa do contexto / cenário

- Há um sistema de controle e gerenciamento de execução de ordens de serviço (OS) em uma oficina mecânica;
- Os clientes levam seus veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas;
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma  OS com data prevista para a entrega;
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;
- O valor de cada peça também irá compor a OS;
- O cliente autoriza a execução dos serviços constantes na OS;
- A mesma equipe de mecânicos avalia e executa os serviços;
- Os mecânicos possuem código técnico, nome, endereço e especialidade;
- Cada OS possui número sequencial, data de emissão, valor total, status e uma data para conclusão dos trabalhos;
- Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS;
- Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.

#### Modelagem

![](banco-de-dados-oficina-mecanica/projeto_oficina_mecanica.png)

Adicionamos entidades e atributos típicos do contexto de oficina mecânica, para que a modelagem represente da melhor forma possível o mundo real. Inserimos a possibilidade de uma auto-peça fornecedora de múltiplas peças automotivas e uma grande gama de serviços possíveis de serem executados na oficina.

##### Conhecimentos e ferramentas:

- Linguagem SQL
- Full-stack - desafio intermediário

- MySQL Workbench (versão linux/ubuntu)
- Typora
- Git / Github
