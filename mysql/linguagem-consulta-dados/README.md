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




