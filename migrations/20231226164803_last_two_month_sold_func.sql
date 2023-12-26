CREATE OR REPLACE FUNCTION get_last_two_month_sold(item Item) RETURNS INT
    LANGUAGE plpgsql
AS $$
DECLARE
    last_two_months_sales INT;
    current_month INT;
BEGIN
    -- Get the current month
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO current_month;

    -- Determine the sales for the last two months based on the current month
    IF current_month = 1 THEN
        last_two_months_sales = item.PYDECSOLD + item.PYNOVSOLD;
    ELSIF current_month = 2 THEN
        last_two_months_sales = item.CYJANSOLD + item.PYDECSOLD;
    ELSIF current_month = 3 THEN
        last_two_months_sales = item.CYFEBSOLD + item.CYJANSOLD;
    ELSIF current_month = 4 THEN
        last_two_months_sales = item.CYMARSOLD + item.CYFEBSOLD;
    ELSIF current_month = 5 THEN
        last_two_months_sales = item.CYAPRSOLD + item.CYMARSOLD;
    ELSIF current_month = 6 THEN
        last_two_months_sales = item.CYMAYSOLD + item.CYAPRSOLD;
    ELSIF current_month = 7 THEN
        last_two_months_sales = item.CYJUNSOLD + item.CYMAYSOLD;
    ELSIF current_month = 8 THEN
        last_two_months_sales = item.CYJULSOLD + item.CYJUNSOLD;
    ELSIF current_month = 9 THEN
        last_two_months_sales = item.CYAUGSOLD + item.CYJULSOLD;
    ELSIF current_month = 10 THEN
        last_two_months_sales = item.CYSEPSOLD + item.CYAUGSOLD;
    ELSIF current_month = 11 THEN
        last_two_months_sales = item.CYOCTSOLD + item.CYSEPSOLD;
    ELSE
        last_two_months_sales = item.CYNOVSOLD + item.CYOCTSOLD;
    END IF;

    RETURN last_two_months_sales;
END;
$$;

