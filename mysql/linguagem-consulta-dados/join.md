# Junções - JOIN

Um Banco de Dados Relacional é formado por várias tabelas que podem ser unidas através das colunas em comuns entre elas; também conhecidas como chaves estrangeiras. 

O MySQL suporta os seguintes tipos de junções (`JOIN`):

1. **`JOIN` Explícito** ou **`INNER JOIN`**: especifica uma junção entre duas tabelas;
2. **`LEFT JOIN`**: preserva as linhas sem correspondência da primeira tabela;
3. **`RIGHT JOIN`**: preserva as linhas sem correspondência da segunda tabela;
4. **`CROSS JOIN`**: produz o produto cartesiano de duas tabelas;
5. **`NATURAL JOIN`**: especifica uma junção de maneira implicita usando as colunas comuns das duas tabelas.


![Exemplo JOIN](img/regiao_estado.svg)


Para aprendermos `JOIN`, considere o relacionamento entre as duas tabelas acima, que possuem na tabela **Região** os principais pontos de referência para localização (p.ex.: Norte, Sul, Leste, Oeste) e a lista dos estados brasileiros na tabela **Estado**.

| id_regiao | nome_regiao  |
|----------:|--------------|
|         1 | Norte        |
|         2 | Nordeste     |
|         3 | Centro-Oeste |
|         4 | Sudeste      |
|         5 | Sul          |
|         6 | Leste        |
|         7 | Oeste        |
|         8 | Sudoeste     |
|         9 | Noroeste     |


| uf | id_regiao | nome_estado         |
|----|-----------|---------------------|
| RO | 1         | Rondônia            |
| AC | 1         | Acre                |
| AM | 1         | Amazonas            |
| RR | 1         | Roraima             |
| PA | 1         | Pará                |
| AP | 1         | Amapá               |
| TO | 1         | Tocantins           |
| MA | 2         | Maranhão            |
| PI | 2         | Piauí               |
| CE | 2         | Ceará               |
| RN | 2         | Rio Grande do Norte |
| PB | 2         | Paraíba             |
| PE | 2         | Pernambuco          |
| AL | 2         | Alagoas             |
| SE | 2         | Sergipe             |
| BA | 2         | Bahia               |
| MG | 4         | Minas Gerais        |
| ES | 4         | Espírito Santo      |
| RJ | 4         | Rio de Janeiro      |
| SP | 4         | São Paulo           |
| PR | 5         | Paraná              |
| SC | 5         | Santa Catarina      |
| RS | 5         | Rio Grande do Sul   |
| MS | 3         | Mato Grosso do Sul  |
| MT | 3         | Mato Grosso         |
| GO | 3         | Goiás               |
| DF | 3         | Distrito Federal    |


## `JOIN` Explícito

Na operação de `JOIN` explícito, cada linha da primeira tabela é comparada com cada linha da segunda tabela. Se os valores em ambas linhas fizer com que a condição de `JOIN` seja avaliada como `verdadeira`, a cláusula `JOIN` cria uma nova linha com todas as colunas das duas tabelas e inclue essa linha no resultado final.

O exemplo a seguir, junta as tabelas **Região** e **Estado** e retorna todas linhas em comum entre elas, considerando o valor da coluna `id_regiao` que é chave primária da tabela `Regiao` e chave estrangeira da tabela `Estado`. Ou seja, `id_regiao` é uma coluna (atributo) em comum entre duas tabelas (entidades).


```sql
SELECT * FROM Regiao
JOIN Estado ON Regiao.id_regiao = Estado.id_regiao;
```

| id_regiao | nome_regiao  | uf | id_regiao | nome_estado         |
|----------:|--------------|----|----------:|---------------------|
|         1 | Norte        | AC |         1 | Acre                |
|         2 | Nordeste     | AL |         2 | Alagoas             |
|         1 | Norte        | AM |         1 | Amazonas            |
|         1 | Norte        | AP |         1 | Amapá               |
|         2 | Nordeste     | BA |         2 | Bahia               |
|         2 | Nordeste     | CE |         2 | Ceará               |
|         3 | Centro-Oeste | DF |         3 | Distrito Federal    |
|         4 | Sudeste      | ES |         4 | Espírito Santo      |
|         3 | Centro-Oeste | GO |         3 | Goiás               |
|         2 | Nordeste     | MA |         2 | Maranhão            |
|         4 | Sudeste      | MG |         4 | Minas Gerais        |
|         3 | Centro-Oeste | MS |         3 | Mato Grosso do Sul  |
|         3 | Centro-Oeste | MT |         3 | Mato Grosso         |
|         1 | Norte        | PA |         1 | Pará                |
|         2 | Nordeste     | PB |         2 | Paraíba             |
|         2 | Nordeste     | PE |         2 | Pernambuco          |
|         2 | Nordeste     | PI |         2 | Piauí               |
|         5 | Sul          | PR |         5 | Paraná              |
|         4 | Sudeste      | RJ |         4 | Rio de Janeiro      |
|         2 | Nordeste     | RN |         2 | Rio Grande do Norte |
|         1 | Norte        | RO |         1 | Rondônia            |
|         1 | Norte        | RR |         1 | Roraima             |
|         5 | Sul          | RS |         5 | Rio Grande do Sul   |
|         5 | Sul          | SC |         5 | Santa Catarina      |
|         2 | Nordeste     | SE |         2 | Sergipe             |
|         4 | Sudeste      | SP |         4 | São Paulo           |
|         1 | Norte        | TO |         1 | Tocantins           |


> Perceba que nos resultados aparecem somente as linhas onde os valores de `id_regiao` são iguais em ambas tabelas, ou seja, os registros: 6 - Leste, 7 - Oeste, 8 - Sudoeste e 9 - Noroeste; foram omitidos dos resultados, porque não existem estados cadastrados para essas regiões.

Você conseguirá obter os mesmos resultados se escrever o mesmo comando com a expressão `INNER JOIN`, porque, `INNER JOIN` e `JOIN` são sinônimos, sendo assim, um pode substituir o outro.

```sql
SELECT * FROM Regiao
INNER JOIN Estado ON Regiao.id_regiao = Estado.id_regiao;
```

Você também pode executar uma junção entre duas tabelas usando um teste de igualdade explícito em uma cláusula WHERE, como `WHERE tabela_1.coluna = tabela_2.coluna`, veja o exemplo abaixo:

```sql
SELECT * FROM Regiao, Estado
WHERE Regiao.id_regiao = Estado.id_regiao;
```


### Compare

```sql
SELECT * FROM Regiao
JOIN Estado ON Regiao.id_regiao = Estado.id_regiao;
```

```sql
SELECT * FROM Regiao
INNER JOIN Estado ON Regiao.id_regiao = Estado.id_regiao;
```

```sql
SELECT * FROM Regiao, Estado
WHERE Regiao.id_regiao = Estado.id_regiao;
```

> As 3 consultas acima foram escritas de maneira diferente, porém, trazem o mesmo resultado! Ou seja, são equivalentes e uma substitui o outra. 


## `LEFT JOIN` - Junção Esquerda

> A junção esquerda seleciona dados começando da tabela à esquerda.

No `LEFT JOIN` cada linha da tabela esquerda é comparada com todas as linhas da tabela direita. Se os valores em ambas linhas fizer com que a condição de `JOIN` seja avaliada como `verdadeira`, a cláusula `LEFT JOIN` cria uma nova linha com todas as colunas das duas tabelas e inclue essa linha no resultado final. Confira o exemplo abaixo:


```sql
SELECT * FROM Regiao
LEFT JOIN Estado ON Regiao.id_regiao = Estado.id_regiao;
```

| id_regiao | nome_regiao  |  uf  | id_regiao | nome_estado         |
|----------:|--------------|:----:|----------:|---------------------|
|         1 | Norte        |  AC  |         1 | Acre                |
|         2 | Nordeste     |  AL  |         2 | Alagoas             |
|         1 | Norte        |  AM  |         1 | Amazonas            |
|         1 | Norte        |  AP  |         1 | Amapá               |
|         2 | Nordeste     |  BA  |         2 | Bahia               |
|         2 | Nordeste     |  CE  |         2 | Ceará               |
|         3 | Centro-Oeste |  DF  |         3 | Distrito Federal    |
|         4 | Sudeste      |  ES  |         4 | Espírito Santo      |
|         3 | Centro-Oeste |  GO  |         3 | Goiás               |
|         2 | Nordeste     |  MA  |         2 | Maranhão            |
|         4 | Sudeste      |  MG  |         4 | Minas Gerais        |
|         3 | Centro-Oeste |  MS  |         3 | Mato Grosso do Sul  |
|         3 | Centro-Oeste |  MT  |         3 | Mato Grosso         |
|         1 | Norte        |  PA  |         1 | Pará                |
|         2 | Nordeste     |  PB  |         2 | Paraíba             |
|         2 | Nordeste     |  PE  |         2 | Pernambuco          |
|         2 | Nordeste     |  PI  |         2 | Piauí               |
|         5 | Sul          |  PR  |         5 | Paraná              |
|         4 | Sudeste      |  RJ  |         4 | Rio de Janeiro      |
|         2 | Nordeste     |  RN  |         2 | Rio Grande do Norte |
|         1 | Norte        |  RO  |         1 | Rondônia            |
|         1 | Norte        |  RR  |         1 | Roraima             |
|         5 | Sul          |  RS  |         5 | Rio Grande do Sul   |
|         5 | Sul          |  SC  |         5 | Santa Catarina      |
|         2 | Nordeste     |  SE  |         2 | Sergipe             |
|         4 | Sudeste      |  SP  |         4 | São Paulo           |
|         1 | Norte        |  TO  |         1 | Tocantins           |
|         6 | Leste        | NULL |      NULL | NULL                |
|         7 | Oeste        | NULL |      NULL | NULL                |
|         8 | Sudoeste     | NULL |      NULL | NULL                |
|         9 | Noroeste     | NULL |      NULL | NULL                |

Veja através do exemplo acima que a junção esquerda `LEFT JOIN` seleciona todos os dados da tabela esquerda, existindo ou não linhas correspondentes na tabela da direita. Caso não seja encontrada nenhuma linha correspondente na tabela da direita, valores `NULL` são usados no conjunto de resultados final.

Para selecionar as regiões que **não** possuem estados cadastrados, basta adicionar a cláusula `WHERE` juntamente com o operador `IS NULL`; confira abaixo:

```sql
SELECT * FROM Regiao
LEFT JOIN Estado ON Regiao.id_regiao = Estado.id_regiao
WHERE Estado.id_regiao IS NULL;
```

| id_regiao | nome_regiao  |  uf  | id_regiao | nome_estado         |
|----------:|--------------|:----:|----------:|---------------------|
|         6 | Leste        | NULL |      NULL | NULL                |
|         7 | Oeste        | NULL |      NULL | NULL                |
|         8 | Sudoeste     | NULL |      NULL | NULL                |
|         9 | Noroeste     | NULL |      NULL | NULL                |



## `RIGHT JOIN` - Junção Direita

> A junção direita seleciona dados começando na tabela direita.

No `RIGHT JOIN` cada linha da tabela esquerda é comparada com todas as linhas da tabela direita. Se os valores em ambas linhas fizer com que a condição de `JOIN` seja avaliada como `verdadeira`, a cláusula `RIGHT JOIN` cria uma nova linha com todas as colunas das duas tabelas e inclue essa linha no resultado final. Se uma linha da tabela direita não tiver linhas correspondentes na tabela esquerda, a coluna da tabela esquerda terá `NULL` no conjunto de resultados finais. Confira o exemplo abaixo:

```sql
SELECT * FROM Regiao
RIGHT JOIN Estado ON Regiao.id_regiao = Estado.id_regiao;
```

| id_regiao | nome_regiao  | uf | id_regiao | nome_estado         |
|----------:|--------------|----|----------:|---------------------|
|         1 | Norte        | AC |         1 | Acre                |
|         2 | Nordeste     | AL |         2 | Alagoas             |
|         1 | Norte        | AM |         1 | Amazonas            |
|         1 | Norte        | AP |         1 | Amapá               |
|         2 | Nordeste     | BA |         2 | Bahia               |
|         2 | Nordeste     | CE |         2 | Ceará               |
|         3 | Centro-Oeste | DF |         3 | Distrito Federal    |
|         4 | Sudeste      | ES |         4 | Espírito Santo      |
|         3 | Centro-Oeste | GO |         3 | Goiás               |
|         2 | Nordeste     | MA |         2 | Maranhão            |
|         4 | Sudeste      | MG |         4 | Minas Gerais        |
|         3 | Centro-Oeste | MS |         3 | Mato Grosso do Sul  |
|         3 | Centro-Oeste | MT |         3 | Mato Grosso         |
|         1 | Norte        | PA |         1 | Pará                |
|         2 | Nordeste     | PB |         2 | Paraíba             |
|         2 | Nordeste     | PE |         2 | Pernambuco          |
|         2 | Nordeste     | PI |         2 | Piauí               |
|         5 | Sul          | PR |         5 | Paraná              |
|         4 | Sudeste      | RJ |         4 | Rio de Janeiro      |
|         2 | Nordeste     | RN |         2 | Rio Grande do Norte |
|         1 | Norte        | RO |         1 | Rondônia            |
|         1 | Norte        | RR |         1 | Roraima             |
|         5 | Sul          | RS |         5 | Rio Grande do Sul   |
|         5 | Sul          | SC |         5 | Santa Catarina      |
|         2 | Nordeste     | SE |         2 | Sergipe             |
|         4 | Sudeste      | SP |         4 | São Paulo           |
|         1 | Norte        | TO |         1 | Tocantins           |

> No exemplo acima não houve nenhuma linha com `NULL`, porque da direita para a esquerda não existem estados que não possuem região atribuida para ele. Logo, o resultado foi similar ao do `JOIN` Explícito.

## `CROSS JOIN` - Junção Cruzada

Diferentemente das técnicas de `JOIN` vistas anteriormente, o `CROSS JOIN` não possui uma condição de `JOIN`. Porque ele produz o *Produto Cartesiano* das linhas das tabelas juntadas, ou seja, o `CROSS JOIN` combina cada linha da primeira tabela com cada linha da segunda tabela pra construir o resultado final. Exemplo:

```sql
SELECT * FROM Regiao
CROSS JOIN Estado;
```

| id_regiao | nome_regiao  | uf | id_regiao | nome_estado         |
|----------:|--------------|:--:|----------:|---------------------|
|         1 | Norte        | AC |         1 | Acre                |
|         2 | Nordeste     | AC |         1 | Acre                |
|         3 | Centro-Oeste | AC |         1 | Acre                |
|         4 | Sudeste      | AC |         1 | Acre                |
|         5 | Sul          | AC |         1 | Acre                |
|         6 | Leste        | AC |         1 | Acre                |
|         7 | Oeste        | AC |         1 | Acre                |
|         8 | Sudoeste     | AC |         1 | Acre                |
|         9 | Noroeste     | AC |         1 | Acre                |
|         1 | Norte        | AL |         2 | Alagoas             |
|         2 | Nordeste     | AL |         2 | Alagoas             |
|         3 | Centro-Oeste | AL |         2 | Alagoas             |
|         4 | Sudeste      | AL |         2 | Alagoas             |
|         5 | Sul          | AL |         2 | Alagoas             |
|         6 | Leste        | AL |         2 | Alagoas             |
|         7 | Oeste        | AL |         2 | Alagoas             |
|         8 | Sudoeste     | AL |         2 | Alagoas             |
|         9 | Noroeste     | AL |         2 | Alagoas             |
|         1 | Norte        | AM |         1 | Amazonas            |
|         2 | Nordeste     | AM |         1 | Amazonas            |
|         3 | Centro-Oeste | AM |         1 | Amazonas            |
|         4 | Sudeste      | AM |         1 | Amazonas            |
|         5 | Sul          | AM |         1 | Amazonas            |
|         6 | Leste        | AM |         1 | Amazonas            |
|         7 | Oeste        | AM |         1 | Amazonas            |
|         8 | Sudoeste     | AM |         1 | Amazonas            |
|         9 | Noroeste     | AM |         1 | Amazonas            |
|         1 | Norte        | AP |         1 | Amapá               |
|         2 | Nordeste     | AP |         1 | Amapá               |
|         3 | Centro-Oeste | AP |         1 | Amapá               |
|         4 | Sudeste      | AP |         1 | Amapá               |
|         5 | Sul          | AP |         1 | Amapá               |
|         6 | Leste        | AP |         1 | Amapá               |
|         7 | Oeste        | AP |         1 | Amapá               |
|         8 | Sudoeste     | AP |         1 | Amapá               |
|         9 | Noroeste     | AP |         1 | Amapá               |
|         1 | Norte        | BA |         2 | Bahia               |
|         2 | Nordeste     | BA |         2 | Bahia               |
|         3 | Centro-Oeste | BA |         2 | Bahia               |
|         4 | Sudeste      | BA |         2 | Bahia               |
|         5 | Sul          | BA |         2 | Bahia               |
|         6 | Leste        | BA |         2 | Bahia               |
|         7 | Oeste        | BA |         2 | Bahia               |
|         8 | Sudoeste     | BA |         2 | Bahia               |
|         9 | Noroeste     | BA |         2 | Bahia               |
|         1 | Norte        | CE |         2 | Ceará               |
|         2 | Nordeste     | CE |         2 | Ceará               |
|         3 | Centro-Oeste | CE |         2 | Ceará               |
|         4 | Sudeste      | CE |         2 | Ceará               |
|         5 | Sul          | CE |         2 | Ceará               |
|         6 | Leste        | CE |         2 | Ceará               |
|         7 | Oeste        | CE |         2 | Ceará               |
|         8 | Sudoeste     | CE |         2 | Ceará               |
|         9 | Noroeste     | CE |         2 | Ceará               |
|         1 | Norte        | DF |         3 | Distrito Federal    |
|         2 | Nordeste     | DF |         3 | Distrito Federal    |
|         3 | Centro-Oeste | DF |         3 | Distrito Federal    |
|         4 | Sudeste      | DF |         3 | Distrito Federal    |
|         5 | Sul          | DF |         3 | Distrito Federal    |
|         6 | Leste        | DF |         3 | Distrito Federal    |
|         7 | Oeste        | DF |         3 | Distrito Federal    |
|         8 | Sudoeste     | DF |         3 | Distrito Federal    |
|         9 | Noroeste     | DF |         3 | Distrito Federal    |
|         1 | Norte        | ES |         4 | Espírito Santo      |
|         2 | Nordeste     | ES |         4 | Espírito Santo      |
|         3 | Centro-Oeste | ES |         4 | Espírito Santo      |
|         4 | Sudeste      | ES |         4 | Espírito Santo      |
|         5 | Sul          | ES |         4 | Espírito Santo      |
|         6 | Leste        | ES |         4 | Espírito Santo      |
|         7 | Oeste        | ES |         4 | Espírito Santo      |
|         8 | Sudoeste     | ES |         4 | Espírito Santo      |
|         9 | Noroeste     | ES |         4 | Espírito Santo      |
|         1 | Norte        | GO |         3 | Goiás               |
|         2 | Nordeste     | GO |         3 | Goiás               |
|         3 | Centro-Oeste | GO |         3 | Goiás               |
|         4 | Sudeste      | GO |         3 | Goiás               |
|         5 | Sul          | GO |         3 | Goiás               |
|         6 | Leste        | GO |         3 | Goiás               |
|         7 | Oeste        | GO |         3 | Goiás               |
|         8 | Sudoeste     | GO |         3 | Goiás               |
|         9 | Noroeste     | GO |         3 | Goiás               |
|         1 | Norte        | MA |         2 | Maranhão            |
|         2 | Nordeste     | MA |         2 | Maranhão            |
|         3 | Centro-Oeste | MA |         2 | Maranhão            |
|         4 | Sudeste      | MA |         2 | Maranhão            |
|         5 | Sul          | MA |         2 | Maranhão            |
|         6 | Leste        | MA |         2 | Maranhão            |
|         7 | Oeste        | MA |         2 | Maranhão            |
|         8 | Sudoeste     | MA |         2 | Maranhão            |
|         9 | Noroeste     | MA |         2 | Maranhão            |
|         1 | Norte        | MG |         4 | Minas Gerais        |
|         2 | Nordeste     | MG |         4 | Minas Gerais        |
|         3 | Centro-Oeste | MG |         4 | Minas Gerais        |
|         4 | Sudeste      | MG |         4 | Minas Gerais        |
|         5 | Sul          | MG |         4 | Minas Gerais        |
|         6 | Leste        | MG |         4 | Minas Gerais        |
|         7 | Oeste        | MG |         4 | Minas Gerais        |
|         8 | Sudoeste     | MG |         4 | Minas Gerais        |
|         9 | Noroeste     | MG |         4 | Minas Gerais        |
|         1 | Norte        | MS |         3 | Mato Grosso do Sul  |
|         2 | Nordeste     | MS |         3 | Mato Grosso do Sul  |
|         3 | Centro-Oeste | MS |         3 | Mato Grosso do Sul  |
|         4 | Sudeste      | MS |         3 | Mato Grosso do Sul  |
|         5 | Sul          | MS |         3 | Mato Grosso do Sul  |
|         6 | Leste        | MS |         3 | Mato Grosso do Sul  |
|         7 | Oeste        | MS |         3 | Mato Grosso do Sul  |
|         8 | Sudoeste     | MS |         3 | Mato Grosso do Sul  |
|         9 | Noroeste     | MS |         3 | Mato Grosso do Sul  |
|         1 | Norte        | MT |         3 | Mato Grosso         |
|         2 | Nordeste     | MT |         3 | Mato Grosso         |
|         3 | Centro-Oeste | MT |         3 | Mato Grosso         |
|         4 | Sudeste      | MT |         3 | Mato Grosso         |
|         5 | Sul          | MT |         3 | Mato Grosso         |
|         6 | Leste        | MT |         3 | Mato Grosso         |
|         7 | Oeste        | MT |         3 | Mato Grosso         |
|         8 | Sudoeste     | MT |         3 | Mato Grosso         |
|         9 | Noroeste     | MT |         3 | Mato Grosso         |
|         1 | Norte        | PA |         1 | Pará                |
|         2 | Nordeste     | PA |         1 | Pará                |
|         3 | Centro-Oeste | PA |         1 | Pará                |
|         4 | Sudeste      | PA |         1 | Pará                |
|         5 | Sul          | PA |         1 | Pará                |
|         6 | Leste        | PA |         1 | Pará                |
|         7 | Oeste        | PA |         1 | Pará                |
|         8 | Sudoeste     | PA |         1 | Pará                |
|         9 | Noroeste     | PA |         1 | Pará                |
|         1 | Norte        | PB |         2 | Paraíba             |
|         2 | Nordeste     | PB |         2 | Paraíba             |
|         3 | Centro-Oeste | PB |         2 | Paraíba             |
|         4 | Sudeste      | PB |         2 | Paraíba             |
|         5 | Sul          | PB |         2 | Paraíba             |
|         6 | Leste        | PB |         2 | Paraíba             |
|         7 | Oeste        | PB |         2 | Paraíba             |
|         8 | Sudoeste     | PB |         2 | Paraíba             |
|         9 | Noroeste     | PB |         2 | Paraíba             |
|         1 | Norte        | PE |         2 | Pernambuco          |
|         2 | Nordeste     | PE |         2 | Pernambuco          |
|         3 | Centro-Oeste | PE |         2 | Pernambuco          |
|         4 | Sudeste      | PE |         2 | Pernambuco          |
|         5 | Sul          | PE |         2 | Pernambuco          |
|         6 | Leste        | PE |         2 | Pernambuco          |
|         7 | Oeste        | PE |         2 | Pernambuco          |
|         8 | Sudoeste     | PE |         2 | Pernambuco          |
|         9 | Noroeste     | PE |         2 | Pernambuco          |
|         1 | Norte        | PI |         2 | Piauí               |
|         2 | Nordeste     | PI |         2 | Piauí               |
|         3 | Centro-Oeste | PI |         2 | Piauí               |
|         4 | Sudeste      | PI |         2 | Piauí               |
|         5 | Sul          | PI |         2 | Piauí               |
|         6 | Leste        | PI |         2 | Piauí               |
|         7 | Oeste        | PI |         2 | Piauí               |
|         8 | Sudoeste     | PI |         2 | Piauí               |
|         9 | Noroeste     | PI |         2 | Piauí               |
|         1 | Norte        | PR |         5 | Paraná              |
|         2 | Nordeste     | PR |         5 | Paraná              |
|         3 | Centro-Oeste | PR |         5 | Paraná              |
|         4 | Sudeste      | PR |         5 | Paraná              |
|         5 | Sul          | PR |         5 | Paraná              |
|         6 | Leste        | PR |         5 | Paraná              |
|         7 | Oeste        | PR |         5 | Paraná              |
|         8 | Sudoeste     | PR |         5 | Paraná              |
|         9 | Noroeste     | PR |         5 | Paraná              |
|         1 | Norte        | RJ |         4 | Rio de Janeiro      |
|         2 | Nordeste     | RJ |         4 | Rio de Janeiro      |
|         3 | Centro-Oeste | RJ |         4 | Rio de Janeiro      |
|         4 | Sudeste      | RJ |         4 | Rio de Janeiro      |
|         5 | Sul          | RJ |         4 | Rio de Janeiro      |
|         6 | Leste        | RJ |         4 | Rio de Janeiro      |
|         7 | Oeste        | RJ |         4 | Rio de Janeiro      |
|         8 | Sudoeste     | RJ |         4 | Rio de Janeiro      |
|         9 | Noroeste     | RJ |         4 | Rio de Janeiro      |
|         1 | Norte        | RN |         2 | Rio Grande do Norte |
|         2 | Nordeste     | RN |         2 | Rio Grande do Norte |
|         3 | Centro-Oeste | RN |         2 | Rio Grande do Norte |
|         4 | Sudeste      | RN |         2 | Rio Grande do Norte |
|         5 | Sul          | RN |         2 | Rio Grande do Norte |
|         6 | Leste        | RN |         2 | Rio Grande do Norte |
|         7 | Oeste        | RN |         2 | Rio Grande do Norte |
|         8 | Sudoeste     | RN |         2 | Rio Grande do Norte |
|         9 | Noroeste     | RN |         2 | Rio Grande do Norte |
|         1 | Norte        | RO |         1 | Rondônia            |
|         2 | Nordeste     | RO |         1 | Rondônia            |
|         3 | Centro-Oeste | RO |         1 | Rondônia            |
|         4 | Sudeste      | RO |         1 | Rondônia            |
|         5 | Sul          | RO |         1 | Rondônia            |
|         6 | Leste        | RO |         1 | Rondônia            |
|         7 | Oeste        | RO |         1 | Rondônia            |
|         8 | Sudoeste     | RO |         1 | Rondônia            |
|         9 | Noroeste     | RO |         1 | Rondônia            |
|         1 | Norte        | RR |         1 | Roraima             |
|         2 | Nordeste     | RR |         1 | Roraima             |
|         3 | Centro-Oeste | RR |         1 | Roraima             |
|         4 | Sudeste      | RR |         1 | Roraima             |
|         5 | Sul          | RR |         1 | Roraima             |
|         6 | Leste        | RR |         1 | Roraima             |
|         7 | Oeste        | RR |         1 | Roraima             |
|         8 | Sudoeste     | RR |         1 | Roraima             |
|         9 | Noroeste     | RR |         1 | Roraima             |
|         1 | Norte        | RS |         5 | Rio Grande do Sul   |
|         2 | Nordeste     | RS |         5 | Rio Grande do Sul   |
|         3 | Centro-Oeste | RS |         5 | Rio Grande do Sul   |
|         4 | Sudeste      | RS |         5 | Rio Grande do Sul   |
|         5 | Sul          | RS |         5 | Rio Grande do Sul   |
|         6 | Leste        | RS |         5 | Rio Grande do Sul   |
|         7 | Oeste        | RS |         5 | Rio Grande do Sul   |
|         8 | Sudoeste     | RS |         5 | Rio Grande do Sul   |
|         9 | Noroeste     | RS |         5 | Rio Grande do Sul   |
|         1 | Norte        | SC |         5 | Santa Catarina      |
|         2 | Nordeste     | SC |         5 | Santa Catarina      |
|         3 | Centro-Oeste | SC |         5 | Santa Catarina      |
|         4 | Sudeste      | SC |         5 | Santa Catarina      |
|         5 | Sul          | SC |         5 | Santa Catarina      |
|         6 | Leste        | SC |         5 | Santa Catarina      |
|         7 | Oeste        | SC |         5 | Santa Catarina      |
|         8 | Sudoeste     | SC |         5 | Santa Catarina      |
|         9 | Noroeste     | SC |         5 | Santa Catarina      |
|         1 | Norte        | SE |         2 | Sergipe             |
|         2 | Nordeste     | SE |         2 | Sergipe             |
|         3 | Centro-Oeste | SE |         2 | Sergipe             |
|         4 | Sudeste      | SE |         2 | Sergipe             |
|         5 | Sul          | SE |         2 | Sergipe             |
|         6 | Leste        | SE |         2 | Sergipe             |
|         7 | Oeste        | SE |         2 | Sergipe             |
|         8 | Sudoeste     | SE |         2 | Sergipe             |
|         9 | Noroeste     | SE |         2 | Sergipe             |
|         1 | Norte        | SP |         4 | São Paulo           |
|         2 | Nordeste     | SP |         4 | São Paulo           |
|         3 | Centro-Oeste | SP |         4 | São Paulo           |
|         4 | Sudeste      | SP |         4 | São Paulo           |
|         5 | Sul          | SP |         4 | São Paulo           |
|         6 | Leste        | SP |         4 | São Paulo           |
|         7 | Oeste        | SP |         4 | São Paulo           |
|         8 | Sudoeste     | SP |         4 | São Paulo           |
|         9 | Noroeste     | SP |         4 | São Paulo           |
|         1 | Norte        | TO |         1 | Tocantins           |
|         2 | Nordeste     | TO |         1 | Tocantins           |
|         3 | Centro-Oeste | TO |         1 | Tocantins           |
|         4 | Sudeste      | TO |         1 | Tocantins           |
|         5 | Sul          | TO |         1 | Tocantins           |
|         6 | Leste        | TO |         1 | Tocantins           |
|         7 | Oeste        | TO |         1 | Tocantins           |
|         8 | Sudoeste     | TO |         1 | Tocantins           |
|         9 | Noroeste     | TO |         1 | Tocantins           |

> Perceba que neste exemplo os resultados da consulta com o `CROSS JOIN` não foi muito interesse, porém,  ele bastante é útil para gerar dados de planejamento, por exemplo: fazer o planejamento de vendas usando a junção cruzada entre clientes, produtos e anos.

## `NATURAL JOIN` - Junção Natural

`NATURAL JOIN` é uma operação `JOIN` que cria uma cláusula de junção implícita para você com base nas colunas comuns nas duas tabelas que estão sendo unidas. Colunas comuns são colunas que têm o mesmo nome nas duas tabelas.

```sql
SELECT * FROM Regiao
NATURAL JOIN Estado;
```

| id_regiao | nome_regiao  | uf | id_regiao | nome_estado         |
|----------:|--------------|----|----------:|---------------------|
|         1 | Norte        | AC |         1 | Acre                |
|         2 | Nordeste     | AL |         2 | Alagoas             |
|         1 | Norte        | AM |         1 | Amazonas            |
|         1 | Norte        | AP |         1 | Amapá               |
|         2 | Nordeste     | BA |         2 | Bahia               |
|         2 | Nordeste     | CE |         2 | Ceará               |
|         3 | Centro-Oeste | DF |         3 | Distrito Federal    |
|         4 | Sudeste      | ES |         4 | Espírito Santo      |
|         3 | Centro-Oeste | GO |         3 | Goiás               |
|         2 | Nordeste     | MA |         2 | Maranhão            |
|         4 | Sudeste      | MG |         4 | Minas Gerais        |
|         3 | Centro-Oeste | MS |         3 | Mato Grosso do Sul  |
|         3 | Centro-Oeste | MT |         3 | Mato Grosso         |
|         1 | Norte        | PA |         1 | Pará                |
|         2 | Nordeste     | PB |         2 | Paraíba             |
|         2 | Nordeste     | PE |         2 | Pernambuco          |
|         2 | Nordeste     | PI |         2 | Piauí               |
|         5 | Sul          | PR |         5 | Paraná              |
|         4 | Sudeste      | RJ |         4 | Rio de Janeiro      |
|         2 | Nordeste     | RN |         2 | Rio Grande do Norte |
|         1 | Norte        | RO |         1 | Rondônia            |
|         1 | Norte        | RR |         1 | Roraima             |
|         5 | Sul          | RS |         5 | Rio Grande do Sul   |
|         5 | Sul          | SC |         5 | Santa Catarina      |
|         2 | Nordeste     | SE |         2 | Sergipe             |
|         4 | Sudeste      | SP |         4 | São Paulo           |
|         1 | Norte        | TO |         1 | Tocantins           |

* Um `NATURAL JOIN` pode ser um `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` basta especificar após a palavra-chave `NATURAL`; O padrão é `INNER JOIN`.
