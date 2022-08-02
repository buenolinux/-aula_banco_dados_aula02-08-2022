USE fluxocaixa;
/*
Vamos criar uma trigger para atualizar a tabela
caixa a cada venda feita
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
VALUES ('2022-08-02',50);

INSERT INTO tab_vendas (data, valor)
VALUES ('2022-08-02',1272);
