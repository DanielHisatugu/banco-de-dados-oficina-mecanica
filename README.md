### <u>Projeto de Banco de Dados para uma Oficina Mecânica</u>

Modelamos um contexto reduzido de uma oficina mecânica como um segundo desafio do bootcamp Database Experience da [Digital Innovation One (DiO)](https://web.dio.me/track/database-experience) , utilizando a ferramenta MySQL Workbench e os conceitos de primary key e foreign key, criando um esquema conceitual para o cenário proposto.

Num segundo momento realizamos a modelagem do projeto lógico baseado no esquema conceitual. Criamos o Script SQL, persistimos dados para realização de testes, criamos queries SQL com as cláusulas SELECT, WHERE, JOIN, ORDER BY e HAVING para recuperar dados suficientes para obter informações complexas, que nos ajudará a entender melhor o cenário de oficina mecânica para tomada de decisões. 

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

#### Modelagem Esquema Conceitual

![projeto_oficina_mecanica](https://user-images.githubusercontent.com/102832749/191406836-85de7fe4-8227-440c-a7c1-f4b4827e202c.png)

Adicionamos entidades e atributos típicos do contexto de oficina mecânica, para que a modelagem represente da melhor forma possível o mundo real. Inserimos a possibilidade de uma auto-peça fornecedora de múltiplas peças automotivas e uma grande gama de serviços possíveis de serem executados na oficina.

#### Projeto Lógico

Consta anexo neste repositório o arquivo do MySQL Workbench com o projeto lógico, com o Script SQL, os dados persistimos e as queries SQL.

##### Conhecimentos e ferramentas:

- Linguagem SQL
- MySQL Workbench (versão linux/ubuntu)
- Typora
- Git / Github
