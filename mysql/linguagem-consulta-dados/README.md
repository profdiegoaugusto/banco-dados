# Linguagem de Consulta de Dados

Como o próprio nome diz, a Linguagem de Consulta de Dados (*Data Query Language - DQL*) é usada para fazer consultas em um banco de dados, ou seja, ela nos permite visualizar as informações armazenadas em um banco de dados. 

## Consultas 

A SQL possui uma instrução básica para recuperar informações de um banco de dados, chamada comando `SELECT`.

```sql
SELECT <lista de atributos>
FROM <lista de tabelas>
WHERE <condições>;
```

O `SELECT` é usado para recuperar dados selecionados de uma ou mais tabelas, onde:

* `<lista de atributos>`: lista dos nomes das colunas, separadas por vírgulas, cujos valores serão recuperados pela consulta (*query*);
* `<lista de tabelas>`: lista dos nomes das tabelas, separadas por vírgulas, necessárias para processar a consulta;
* `<condições>`: expressão lógica (booleana) que identifica e filtra as linhas que serão selecionadas pela consulta.



## Filtragem

A cláusula `WHERE` nos permite especifificar uma condição lógica para filtrar as linhas que serão selecionadas pela consulta. Para tal, usamos os operadores de comparação lógica para comparar dados e/ou valores das colunas colunas entre si. As tabelas a seguir, apresentam os operadores de comparação e lógica que usaremos em nossas consultas.

### Operadores Relacionais

| Operação       | Operador | Exemplo |
|----------------|----------|---------|
| Igualdade      | =        | a = b   |
| Diferença      | ≠        | a <> b  |
| Maior que      | >        | a > b   |
| Menor que      | <        | a < b   |
| Maior ou Igual | ≥        | a >= b  |
| Menor ou Igual | ≤        | a <= b  |


### Operadores Lógicos

| Operação       | Operador | Exemplo |
|----------------|----------|---------|
| Igualdade      | AND      | a AND b |
| Diferença      | OR       | a OR b  |
| Maior que      | NOT      | NOT a   |


#### Sintaxe AND

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE condicao1 AND condicao2 AND condicao3;
```

#### Sintaxe OR


```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE condicao1 OR condicao2 OR condicao3;
```

#### Sintaxe NOT

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE NOT condicao;
```

### Operadores Especiais da SQL

Além dos operadores lógicos (booleanos) clássicos que encontramos em qualquer linguagem de programação, a SQL possui um conjunto de operadores especiais que também podem ser usados para filtrar os resultados de uma consulta, são eles: `BETWEEN`, `LIKE`, `IS NULL`, `DISTINCT`, `LIMIT`.


#### Sintaxe BETWEEN

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE coluna BETWEEN valor1 AND valor2;
```

* Seleciona valores dentro de uma série (intervalo);
* Os valores podem ser: números, textos ou datas;
* O operador é inclusive, ou seja, os valores de início (valor1) e fim(valor2) aparecerão no resultado da consulta.

#### Sintaxe LIKE

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE coluna LIKE padrão;
```

* O operador `LIKE` é usado em uma cláusula `WHERE` para procurar um padrão especificado em uma coluna.
* Existem dois caracteres curingas frequentemente usados em conjunto com o operador `LIKE`:
    * `Porcentagem (%)`: representa zero, um ou vários caracteres;
    * `Sublinhado (__)`: representa um único caractere.


| Comando                   | Signficado                                                        |
|---------------------------|-------------------------------------------------------------------|
| `WHERE nome LIKE‘a%’;`    | Qualquer valor que começa com "a"                                 |
| `WHERE nome LIKE ‘%a’;`   | Quaisquer valores que terminem com "a"                            |
| `WHERE nome LIKE ‘%de%’;` | Qualquer valor que tenha "de" em qualquer posição                 |
| `WHERE nome LIKE ‘_e%’;`  | Quaisquer valores que tenham “e" na segunda posição               |
| `WHERE nome LIKE ‘a__%’;` | Qualquer valor que comece com "a" e tenha pelo menos 3 caracteres |
| `WHERE nome LIKE ‘a%o’;`  | Quaisquer valores que começam com "a" e terminam com "o"          |
 

#### Sintaxe IS NULL

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE coluna IS NULL;
```

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE coluna IS NOT NULL;
```

* Não é possível testar valores `NULL` com operadores de comparação, por exemplo: `=`, `<` ou `<>`; para estes casos você deverá usar: `IS NULL` ou `IS NOT NULL`;
* Um campo com valor `NULL` é um campo vazio, ou seja, não possui nenhum valor dentro;
    * Um valor `NULL` é diferente de um valor zero ou de um campo que contém espaços em branco.
    * Um campo com um valor `NULL` é aquele que foi deixado em branco durante a inserção de um novo registro!

#### Sintaxe DISTINCT

```sql
SELECT DISTINCT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE condicao;
```

* Uma coluna pode ter vários valores duplicados, porém, muitas vezes você vair querer listar os diferentes valores (distintos) existentes em uma coluna;

* O comando `SELECT DISTINCT` serve para remover valores duplicados em um resultado de uma consulta feita em um banco de dados. 


#### Sintaxe LIMIT

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE condicao;
LIMIT numero
```

* A palavra-chave `LIMIT` é usada para espeficiar a quantidade de registros que serão retornados em uma consulta;
* `LIMIT` é útil em tabelas grandes com milhares de registros, pois, retornar um grande número de registros pode impactar o desempenho;
* `LIMIT` corresponde ao `SELECT TOP` do `SQL SERVER`

## Ordenação

A SQL permite ordernar os resultados de uma consulta, pelos valores de uma ou mais colunas que aparecem no resultado final da consultao usando cláusula `ORDER BY`.

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
ORDER BY coluna1, coluna2, . . . ASC | DESC;
```

A ordenação padrão dos valores é crescente, porém, você pode usar a palavra-chave `DESC` para visualizar os valores do resultado final em ordem decrescente. Caso queira especificar uma ordenação crescente de maneira explícita, basta usar a palavra-chave `ASC`.


## Funções Agregadas

Uma função agregada executa um cálculo em vários valores valores das linhas de determinada(s) coluna(s) e retorna um único valor como resultado. Por exemplo, a função agregada `SUM()` retorna a soma das linhas da coluna do tipo numérica passada como parâmetro.

### Sintaxe

```sql
NOME_FUNCAO(DISTINCT | ALL expressão)
```

1. `NOME_FUNCAO`: especifique o nome da função agregada que você vai usar, por exemplo: `COUNT()`, `SUM()`,  `AVG()` ,  `MAX()` ou  `MIN()`; veja a lista completa de funções na tabela [Funções Agregadas do MySQL](#funções-agregadas-do-mysQL);

2. `DISTINCT` ou `ALL`: caso você queira fazer o cálculo baseado em valores distintos, ou seja, sem repetição, use o `DISTINCT` no parâmetro da função. Caso contrário, para usar todos os valores da coluna, incluindo valores repetidos, use o `ALL`. O padrão de toda função agregada é `ALL`, logo, não precisa escrever a palavra-chave no parâmetro da função;

3. *expressão*: especifique o nome da(s) coluna(s) ou um expressão envolvendo colunas e operadores aritméticos.

### Funções Agregadas do MySQL

| Nome               | Descrição                                                    |
|--------------------|--------------------------------------------------------------|
| `COUNT()`          | Retorna uma contagem do número de linhas retornadas          |
| `COUNT(DISTINCT)`  | Retorna a contagem de vários valores diferentes              |
| `SUM()`            | Retorna a soma                                               |
| `AVG()`            | Retorna o valor médio do argumento                           |
| `MAX()`            | Retorna o valor máximo                                       |
| `MIN()`            | Retorna o valor mínimo                                       |
| `GROUP_CONCAT()`   | Retorna uma string concatenada                               |
| `STD()`            | Retorna o desvio padrão da população                         |
| `STDDEV()`         | Retorna o desvio padrão da população                         |
| `STDDEV_POP()`     | Retorna o desvio padrão da população                         |
| `STDDEV_SAMP()`    | Retornar o desvio padrão da amostra                          |
| `VAR_POP()`        | Retorna a variância padrão da população                      |
| `VAR_SAMP()`       | Retorna a variância da amostra                               |
| `VARIANCE()`       | Retorna a variância padrão da população                      |
| `JSON_ARRAYAGG()`  | Retorna um conjunto de resultados em um vetor único em JSON  |
| `JSON_OBJECTAGG()` | Retorna um conjunto de resultados em um objeto único em JSON |
| `BIT_AND()`        | Retorna bit a bit AND                                        |
| `BIT_OR()`         | Retorna bit a bit OR                                         |
| `BIT_XOR()`        | Retorna bit a bit XOR                                        |


#### EXEMPLO - `COUNT()`

> Com que frequência um determinado tipo de dados ocorre em uma tabela?

* A função agregada `COUNT()` retorna o número de linhas em uma tabela;
* Ela permite contar todas as linhas ou apenas as linhas que correspondem a uma condição especificada;
* E possui três formas:
    * `COUNT(*)`: retorna o número de linhas em um conjunto de resultados retornado por uma instrução `SELECT`; no resultado podem aparecer **linhas duplicadas**, `NOT NULL` e `NULL`.
    * `COUNT(expressão)`: retorna o número de linhas que não contêm valores `NULL` como resultado de uma expressão;
    * `COUNT(DISTINCT expressão)` retorna o número de linhas distintas (sem repetição) que não contêm valores `NULL` como resultado da expressão.

##### Exemplo 1

```sql
SELECT COUNT(*)
FROM Estado;
```

| id_estado | uf | nome_estado    |
|----------:|:--:|----------------|
|         1 | MG | Minas Gerais   |
|         2 | ES | Espírito Santo |
|         3 | RJ | Rio de Janeiro |
|         4 | SP | São Paulo      |

| COUNT(*) |
|---------:|
|        4 |


##### Exemplo 2

```sql
SELECT COUNT(id_produto)
FROM Produto;
```

| COUNT(id_produto) |
|------------------:|
|               750 |

#### EXEMPLO - `SUM()`

> Permite calcular a soma dos valores em um conjunto.

* Se você usar a função `SUM()` em uma instrução `SELECT` que não retorna nenhuma linha, a função `SUM()` retorna `NULL`, não zero;
* O `DISTINCT` faz com que função `SUM()` calcule apenas a soma dos valores que não se repetem em um conjunto;
* Valores `NULL` são ignorados no cálculo.

##### Exemplo 1

| numero |
|-------:|
|      1 |
|      1 |
|      1 |
|  `NULL`|
|      3 |
|      4 |

```sql
SELECT SUM(numero)
FROM NumeroInteiro;
```

| SUM(numero) |
|------------:|
|          10 |

```sql
SELECT SUM(DISTINCT numero)
FROM NumeroInteiro;
```

| SUM(DISTINCT numero) |
|---------------------:|
|                    8 |

> Compare os dois exemplos e perceba que os números 1, repetidos na tabela 3 vezes, foram ignorados no cálculo da soma devido o uso do `DISTINCT`.

##### Exemplo 2

```sql
SELECT id_pedido, quantidade, preco
FROM Pedido
WHERE id_pedido = 7;
```

| id_pedido | quantidade | preco |
|----------:|-----------:|------:|
|         7 |          5 | 30.00 |
|         7 |          2 | 10.00 |
|         7 |          3 | 25.00 |
|         7 |          7 | 12.00 |

```sql
SELECT SUM(quantidade * preco)
FROM Pedido
WHERE id_pedido = 7;
```

| SUM(quantidade * preco) |
|------------------------:|
|                     329 |

> O exemplo acima calcula o preço total de um determinado pedido através da expressão: `quantidade * preco`; passada como parâmetro na função `SUM()`.


#### EXEMPLO - `AVG()`

> Permite calcular a soma dos valores em um conjunto.

* O `DISTINCT` faz com que função `AVG()` calcule apenas a média dos valores que não se repetem em um conjunto;
* Valores `NULL` são ignorados no cálculo.

##### Exemplo

| numero |
|-------:|
|      1 |
|      1 |
|      1 |
|  `NULL`|
|      3 |
|      4 |

```sql
SELECT AVG(numero)
FROM NumeroInteiro;
```

| AVG(numero) |
|------------:|
|       2.0000|

> `AVG(numero)` : (1 + 1 + 1 + 3 + 4) / 5


```sql
SELECT AVG(DISTINCT numero)
FROM NumeroInteiro;
```

| AVG(DISTINCT numero) |
|---------------------:|
|                2.6667|

> `AVG(DISTINCT numero)` : (1 + 3 + 4) / 3


#### EXEMPLO - `MAX()`

> Retorna o valor máximo em um conjunto de valores.


##### Exemplo 1

| numero |
|-------:|
|      1 |
|      1 |
|      1 |
|  `NULL`|
|      3 |
|      4 |

```sql
SELECT MAX(numero)
FROM NumeroInteiro;
```

| MAX(numero) |
|------------:|
|            4|



#### EXEMPLO - `MIN()`

> Retorna o valor mínimo em um conjunto de valores.


##### Exemplo 1

| numero |
|-------:|
|      1 |
|      1 |
|      1 |
|  `NULL`|
|      3 |
|      4 |

```sql
SELECT MIN(numero)
FROM NumeroInteiro;
```

| MAX(numero) |
|------------:|
|            1|


### Cláusula `Group By`

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela
WHERE condição
GROUP BY coluna1, coluna2, coluna3, . . .
ORDER BY coluna1, coluna2, coluna3, . . .;
```

* O `GROUP BY` é frequentemente usado com funções agregadas (`COUNT`, `MAX`, `MIN`, `SUM`, `AVG`) para agrupar o conjunto de resultados por uma ou mais colunas;
* Ele agrupa um conjunto de linhas em um conjunto de linhas de resumo por valores de colunas ou expressões;
* Como é retornada uma linha para cada grupo o número de linhas no conjunto de resultados é menor.

##### Exemplo 1

```sql
SELECT estado, COUNT(*)
FROM Pedido
GROUP BY estado;
```

| estado           | COUNT(*) |
|:-----------------|---------:|
| Cancelado        | 6        |
| Em processamento | 3        |
| Em espera        | 7        |
| Enviado          | 4        |

##### Exemplo 2

```sql
SELECT ano, SUM(lucro)
FROM Venda
GROUP BY ano;
```

| ano  | SUM(lucro) |
|:-----|-----------:|
| 2018 | 4650       |
| 2019 | 5000       |

##### Exemplo 3

```sql
SELECT pais, COUNT(id_cliente)
FROM Cliente
GROUP BY pais
HAVING COUNT(id_cliente);
```

> A cláusula `HAVING` filtra os resultados da função agregada!
> Ela foi adicionada à linguagem SQL porque a palavra-chave `WHERE` **não pode ser usada com funções agregadas.**

```sql
SELECT id_departamento, SUM(qtde_vendas)
FROM Venda
WHERE data_venda = '2020-02-29'
GROUP BY id_departamento
HAVING SUM(qtde_vendas) > 1000;
```

> Perceba que no exemplo acima temos a presença das cláusulas `WHERE` e `HAVING` juntas na consulta; isso é possível, porque a cláusula `GROUP BY` é avaliada depois das cláusulas `FROM`, `WHERE` e `SELECT` e antes das seções `HAVING`, `ORDER BY` e `LIMIT`.
> `HAVING` **é usada somente para filtrar os resultados gerados pela função agregada**, para as outras filtragens da consulta é necessário usar a cláusula `WHERE`.


##### Exemplo 4

```sql
SELECT nome_produto, SUM(qtde_estoque), SUM(qtde_estoque * preco_unitario)
FROM Produto
GROUP BY nome
HAVING SUM(qtde_estoque) > 400 AND SUM(qtde_estoque * preco_unitario) >= 7000;
```

### Subconsulta

> Uma subconsulta é um comando `SELECT` dentro de outro.

#### Sintaxe

```sql
SELECT coluna1, coluna2, coluna3, . . .
FROM nome_da_tabela_1
WHERE coluna1 = (
    SELECT coluna1
    FROM nome_da_tabela_2
);
```



As principais vantagens das subconsultas são:

* Elas permitem consultas estruturadas de tal forma que seja possível isolar cada trecho de código de sua consulta;
* Elas fornecem maneiras alternativas de executar operações que, de outra forma, exigiriam junções (`JOIN`) e uniões (`UNION`) complexas
* Muitas pessoas acham subconsultas mais legíveis do que junções (`JOIN`)  ou uniões (`UNION`) complexas.
* De fato, foi a inovação das subconsultas que deu às pessoas a ideia original de chamar a SQL de Linguagem de Consulta Estruturada (*"Structured Query Language"*).