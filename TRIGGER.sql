USE fluxocaixa;
/*
Vamos criar uma trigger para atualizar a tabela
caixa a cada venda feita
É uma boa prática usar o prefixo tgr nos nomes das trigger
*/

CREATE TRIGGER tgr_VendaInserida
ON tab_vendas
FOR INSERT
AS
BEGIN
	DECLARE
	@var_valor DECIMAL(10,2),
	@var_date DATE
	SELECT @var_date =  data, @var_valor = valor FROM INSERTED
	UPDATE tab_caixa SET saldo_final = saldo_final + @var_valor
	WHERE data = @var_date
END;
/* SELECT nas tabelas*/
SELECT * FROM tab_caixa;
SELECT * FROM tab_vendas;
/* Vamos inserir uma venda */

INSERT INTO tab_vendas (data, valor)
VALUES ('2022-08-02',1272);

/*
Vamos criar uma trigger para atualizar a tabela
caixa a cada venda excluída
*/

CREATE TRIGGER tgr_VendaExcluida
ON tab_vendas
FOR DELETE 
AS
BEGIN 
	DECLARE
	@var_valor DECIMAL(10,2),
	@var_data DATE
	SELECT @var_data = data, @var_valor = valor FROM DELETED
	UPDATE tab_caixa SET saldo_final = saldo_final - @var_valor
	WHERE data = @var_data
END;



SELECT * FROM tab_caixa;
SELECT * FROM tab_vendas;

/*
	Vamos excluir uma venda
*/

DELETE FROM tab_vendas WHERE id_venda = 1;

/* Para visualizar todas as trigger do sistema */

SELECT * FROM sys.triggers;

/* ------------------------------------------------------*/

/*
Funções internas 
-- DATEDIFF
-- Diferença entre datas
*/
