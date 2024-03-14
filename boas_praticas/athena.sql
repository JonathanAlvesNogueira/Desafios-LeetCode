-- NO AWS ATHENA AS CONSULTAS SÃO PAGAS ENTÃO FICA DIFICIL CRIAR VARIAS TABELAS E DEPOIS UTILIZA-LAS FAZENDO LEFT JOIN, EM ALGUNS CASOS SE RECOMENDA USAR SUBQUERIES EXEMPLOS

-- ALGUMAS BASES POSSUEM PARTIÇÕES, COMO SE FOSSE VERSÃO DA PRÓPRIA BASE ENTÃO SE TIVER COMO É O CASO ABAIXO É NECESSÁRIO FILTRAR TAMBÉM

CREATE TABLE AS
SELECT 
    A.ID_CHAVE_CLIENTE
    ,A.CPF_CNPJ_CLIENTE
    ,A.RENDA_FATURAMENTO 
    ,B.SCORE
    ,B.SCORE_FRAUDE
    ,B.FLAG_ATRASO_OUTROS_BANCOS
    ,B.FL_COMPROMETIMENTO
    ,B.ID_CHAVE_CLIENTE
    ,ANOMESDIA
FROM  (
    SELECT 
        ID_CHAVE_CLIENTE
        ,CPF_CNPJ_CLIENTE
        ,RENDA_FATUR_CLIENTE AS RENDA_FATURAMENTO
        ,ANOMESDIA
    FROM TABELA_INFORMACOES_CLIENTE
    WHERE ANOMESDIA = (SELECT MAX(ANOMESDIA) FROM TABELA_INFORMACOES_CLIENTE)
) AS A 
  LEFT JOIN (
    SELECT 
        SCORE
        ,SCORE_FRAUDE
        ,FLAG_ATRASO_OUTROS_BANCOS
        ,FL_COMPROMETIMENTO
        ,ID_CHAVE_CLIENTE
        ,ANOMESDIA
    FROM SERASA_INFO_CREDITO
    WHERE ANOMESDIA = (SELECT MAX(ANOMESDIA) FROM TABELA_INFORMACOES_CLIENTE)
) AS B ON A.ID_CHAVE_CLIENTE = B.ID_CHAVE_CLIENTE
WHERE ID_CHAVE_CLIENTE > 0 
;