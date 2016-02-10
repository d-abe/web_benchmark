CREATE TABLE sales
(
  -- 売上日.
  sold_on DATE NOT NULL,
 
  -- 売上金額.
  amount INTEGER NOT NULL
);

CREATE INDEX "idx_sales_sold_on" ON "public"."sales" USING btree(sold_on ASC NULLS LAST);
COMMENT ON INDEX "public"."idx_sales_sold_on" IS NULL;

INSERT INTO
  sales (sold_on, amount)
SELECT
  '2016-01-01'::DATE + (RANDOM() * 31)::INTEGER AS sold_on,
  (RANDOM() * 1000)::INTEGER + 1000 AS amount
FROM
  -- 100 件生成するように変更
  GENERATE_SERIES(1, 100000)
ORDER BY
  sold_on
;