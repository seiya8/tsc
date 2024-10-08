SELECT
    ODTL.ITEM_CODE AS CODE,
    ITEM.ITEM_NAME AS NAME,
    SUM(ODTL.ORDER_QTY) AS SUM_QTY
FROM
    ORDERS
    INNER JOIN WAREHOUSE
        ON ORDERS.WH_CODE = WAREHOUSE.WH_CODE
        AND WAREHOUSE.WH_NAME = '浦和倉庫'
    INNER JOIN ORDERS_DTL ODTL
        ON ORDERS.ORDER_NO = ODTL.ORDER_NO
    LEFT OUTER JOIN ITEM
        ON ODTL.ITEM_CODE = ITEM.ITEM_CODE
GROUP BY
    ODTL.ITEM_CODE,
    ITEM.ITEM_NAME
HAVING SUM_QTY >= 50
ORDER BY
    SUM_QTY DESC,
    CODE DESC;
