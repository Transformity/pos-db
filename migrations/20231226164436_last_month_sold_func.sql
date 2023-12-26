CREATE OR REPLACE FUNCTION get_last_month_sold(item Item) RETURNS INT
    LANGUAGE plpgsql
AS $$
DECLARE
    last_month_sales INT;
    current_month INT;
BEGIN
    -- Get the current month
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO current_month;

    -- Determine the previous month's sales based on the current month
    IF current_month = 1 THEN
        last_month_sales = item.PYDECSOLD;
    ELSIF current_month = 2 THEN
        last_month_sales = item.CYJANSOLD;
    ELSIF current_month = 3 THEN
        last_month_sales = item.CYFEBSOLD;
    ELSIF current_month = 4 THEN
        last_month_sales = item.CYMARSOLD;
    ELSIF current_month = 5 THEN
        last_month_sales = item.CYAPRSOLD;
    ELSIF current_month = 6 THEN
        last_month_sales = item.CYMAYSOLD;
    ELSIF current_month = 7 THEN
        last_month_sales = item.CYJUNSOLD;
    ELSIF current_month = 8 THEN
        last_month_sales = item.CYJULSOLD;
    ELSIF current_month = 9 THEN
        last_month_sales = item.CYAUGSOLD;
    ELSIF current_month = 10 THEN
        last_month_sales = item.CYSEPSOLD;
    ELSIF current_month = 11 THEN
        last_month_sales = item.CYOCTSOLD;
    ELSE
        last_month_sales = item.CYNOVSOLD;
    END IF;

    RETURN last_month_sales;
END;
$$;

