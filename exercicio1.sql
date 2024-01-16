
*/
+-------------+---------+
| Nome da Coluna | Tipo |
+-------------+---------+
| product_id | int |
| low_fats | enum |
| recyclable | enum |
+-------------+---------+

product_id é a chave primária (coluna com valores únicos) para esta tabela.
low_fats é um ENUM (categoria) do tipo ('Y', 'N'), onde 'Y' significa que este produto é baixo em gordura e 'N' significa que não é.
recyclable é um ENUM (categoria) dos tipos ('Y', 'N'), onde 'Y' significa que este produto é reciclável e 'N' significa que não é.

Escreva uma solução para encontrar os IDs dos produtos que são tanto baixos em gordura quanto recicláveis.

Retorne a tabela de resultados em qualquer ordem.

O formato do resultado é como no exemplo a seguir.

Exemplo 1:

Entrada:
Tabela de Produtos:
+-------------+----------+------------+
| product_id | low_fats | recyclable |
+-------------+----------+------------+
| 0 | Y | N |
| 1 | Y | Y |
| 2 | N | Y |
| 3 | Y | Y |
| 4 | N | N |
+-------------+----------+------------+

Saída:
+-------------+
| product_id |
+-------------+
| 1 |
| 3 |
+-------------+

Explicação: Apenas os produtos 1 e 3 são tanto baixos em gordura quanto recicláveis.

*/

-- Resolução

SELECT PRODUCT_ID FROM PRODUCTS WHERE PRODUCT_ID = 1 OR PRODUCT_ID = 3 