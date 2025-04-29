
/*The fiscal year in Northwind starts on September 1.

For each customer, show the total revenue from orders placed in the fiscal year starting September 1, 2016. 
Show three columns: customer_id, company_name, and total_revenue. */


SELECT
  customers.customer_id,
  customers.company_name,
  SUM(amount) AS total_revenue
FROM orders
JOIN customers
	ON orders.customer_id = customers.customer_id
WHERE order_date >= '2016-09-01'AND order_date < '2016-09-01':: DATE + INTERVAL '12' month
GROUP BY customers.customer_id, customers.company_name;


customer_id | company_name                       | total_revenue
------------|------------------------------------|--------------
ALFKI       | Alfreds Futterkiste                | 814.50
ANATR       | Ana Trujillo Emparedados y helados | 568.55
ANTON       | Antonio Moreno Taquería            | 5175.11
AROUT       | Around the Horn                    | 3929.60
BERGS       | Berglunds snabbköp                 | 9626.34
BLAUS       | Blauer See Delikatessen            | 1079.80
BLONP       | Blondesddsl père et fils           | 15968.08
BOLID       | Bólido Comidas preparadas          | 982.00
BONAP       | Bon app'                           | 9263.48
BOTTM       | Bottom-Dollar Markets              | 6345.05
BSBEV       | B's Beverages                      | 3179.50
CACTU       | Cactus Comidas para llevar         | 225.50
CHOPS       | Chop-suey Chinese                  | 3431.80
COMMI       | Comércio Mineiro                   | 1128.00
CONSH       | Consolidated Holdings              | 787.60
DRACD       | Drachenblut Delikatessen           | 533.60
DUMON       | Du monde entier                    | 692.80
EASTC       | Eastern Connection                 | 4809.35
ERNSH       | Ernst Handel                       | 41748.74
FAMIA       | Familia Arquibaldo                 | 3819.75
FOLIG       | Folies gourmandes                  | 7363.90
FOLKO       | Folk och fä HB                     | 7477.12
FRANK       | Frankenversand                     | 10132.82
FRANS       | Franchi S.p.A.                     | 49.80
FURIB       | Furia Bacalhau e Frutos do Mar     | 5081.24
GALED       | Galería del gastrónomo             | 629.20
GODOS       | Godos Cocina Típica                | 4576.15
GOURL       | Gourmet Lanchonetes                | 1020.00
GREAL       | Great Lakes Food Market            | 6673.71
HANAR       | Hanari Carnes                      | 3481.52
HILAA       | HILARION-Abastos                   | 12886.30
HUNGC       | Hungry Coyote Import Store         | 1362.20
HUNGO       | Hungry Owl All-Night Grocers       | 18959.31
ISLAT       | Island Trading                     | 1890.10
KOENE       | Königlich Essen                    | 6309.11
LAMAI       | La maison d'Asie                   | 5445.53
LAUGB       | Laughing Bacchus Wine Cellars      | 335.50
LAZYK       | Lazy K Kountry Store               | 357.00
LEHMS       | Lehmanns Marktstand                | 11056.91
LETSS       | Let's Stop N Shop                  | 317.75
LILAS       | LILA-Supermercado                  | 8434.48
LINOD       | LINO-Delicateses                   | 4704.05
LONEP       | Lonesome Pine Restaurant           | 1129.20
MAGAA       | Magazzini Alimentari Riuniti       | 3760.68
MAISD       | Maison Dewey                       | 2380.00
MEREP       | Mère Paillarde                     | 28233.70
MORGK       | Morgenstern Gesundkost             | 2147.40
NORTS       | North/South                        | 352.00
OCEAN       | Océano Atlántico Ltda.             | 429.20
OLDWO       | Old World Delicatessen             | 6996.30
OTTIK       | Ottilies Käseladen                 | 4176.28
PERIC       | Pericles Comidas clásicas          | 2746.20
PICCO       | Piccolo und mehr                   | 16021.56
PRINI       | Princesa Isabel Vinhos             | 2411.04
QUEDE       | Que Delícia                        | 3500.93
QUEEN       | Queen Cozinha                      | 14693.32
QUICK       | QUICK-Stop                         | 39108.18
RANCH       | Rancho grande                      | 443.40
RATTC       | Rattlesnake Canyon Grocery         | 25424.93
REGGC       | Reggiani Caseifici                 | 1221.94
RICAR       | Ricardo Adocicados                 | 4633.28
RICSU       | Richter Supermarkt                 | 3921.40
ROMEY       | Romero y tomillo                   | 498.50
SANTG       | Santé Gourmet                      | 1758.40
SAVEA       | Save-a-lot Markets                 | 40452.00
SEVES       | Seven Seas Imports                 | 10837.99
SIMOB       | Simons bistro                      | 13072.20
SPLIR       | Split Rail Beer & Ale              | 8286.63
SUPRD       | Suprêmes délices                   | 8818.28
THEBI       | The Big Cheese                     | 336.00
THECR       | The Cracker Box                    | 1393.24
TOMSP       | Toms Spezialitäten                 | 2004.34
TORTU       | Tortuga Restaurante                | 7134.10
TRADH       | Tradição Hipermercados             | 1320.40
TRAIH       | Trail's Head Gourmet Provisioners  | 1333.30
VAFFE       | Vaffeljernet                       | 5979.05
VICTE       | Victuailles en stock               | 5512.32
VINET       | Vins et alcools Chevalier          | 121.60
WANDK       | Die Wandernde Kuh                  | 7079.55
WARTH       | Wartian Herkku                     | 11089.70
WELLI       | Wellington Importadora             | 3222.14
WHITC       | White Clover Markets               | 6490.86
WILMK       | Wilman Kala                        | 120.00
WOLZA       | Wolski Zajazd                      | 1267.00
