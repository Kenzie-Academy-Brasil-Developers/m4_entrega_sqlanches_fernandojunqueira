-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
  pe.id ,
  pe.status,
  pe.cliente_id,
  pr.id ,
  pr.nome ,
  pr.tipo ,
  pr.preço ,
  pr.pts_de_lealdade 	
FROM 
pedidos pe 
FULL JOIN 
produtos_pedidos pp ON pe.id = pp.pedido_id 
FULL JOIN 
produtos pr ON pp.produto_id = pr.id ;
-- 2)
SELECT 
pe.id  	
FROM 
pedidos pe 
FULL JOIN 
produtos_pedidos pp ON pe.id = pp.pedido_id 
FULL JOIN 
produtos pr ON pp.produto_id = pr.id 
WHERE
pr.nome = 'Fritas';
-- 3)
SELECT 
  c.nome gostam_de_fritas 
FROM 
pedidos pe 
JOIN 
produtos_pedidos pp ON pe.id = pp.pedido_id 
JOIN 
produtos pr ON pp.produto_id = pr.id 
JOIN 
clientes c ON c.id = pe.cliente_id 
WHERE
pr.nome = 'Fritas';
-- 4)
SELECT 
ROUND(SUM(pr.preço)::numeric,2)
FROM 
pedidos pe 
JOIN 
produtos_pedidos pp ON pe.id = pp.pedido_id 
JOIN 
produtos pr ON pp.produto_id = pr.id 
JOIN 
clientes c ON c.id = pe.cliente_id 
WHERE 
c.nome = 'Laura';
-- 5)
SELECT 
pr.nome , count(*)
FROM 
pedidos pe 
JOIN 
produtos_pedidos pp ON pe.id = pp.pedido_id 
JOIN 
produtos pr ON pp.produto_id = pr.id 
JOIN 
clientes c ON c.id = pe.cliente_id 
GROUP BY
pr.nome
ORDER BY 
pr.nome;