CREATE OR REPLACE FUNCTION get_last_three_month_sold(item Item) RETURNS INT
    LANGUAGE plpgsql
AS $$
DECLARE
    last_three_months_sales INT;
    current_month INT;
BEGIN
    -- Get the current month
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO current_month;

    -- Determine the sales for the last three months based on the current month
    IF current_month = 1 THEN
        last_three_months_sales = item.PYDECSOLD + item.PYNOVSOLD + item.PYOCTSOLD;
    ELSIF current_month = 2 THEN
        last_three_months_sales = item.CYJANSOLD + item.PYDECSOLD + item.PYNOVSOLD;
    ELSIF current_month = 3 THEN
        last_three_months_sales = item.CYFEBSOLD + item.CYJANSOLD + item.PYDECSOLD;
    ELSIF current_month = 4 THEN
        last_three_months_sales = item.CYMARSOLD + item.CYFEBSOLD + item.CYJANSOLD;
    ELSIF current_month = 5 THEN
        last_three_months_sales = item.CYAPRSOLD + item.CYMARSOLD + item.CYFEBSOLD;
    ELSIF current_month = 6 THEN
        last_three_months_sales = item.CYMAYSOLD + item.CYAPRSOLD + item.CYMARSOLD;
    ELSIF current_month = 7 THEN
        last_three_months_sales = item.CYJUNSOLD + item.CYMAYSOLD + item.CYAPRSOLD;
    ELSIF current_month = 8 THEN
        last_three_months_sales = item.CYJULSOLD + item.CYJUNSOLD + item.CYMAYSOLD;
    ELSIF current_month = 9 THEN
        last_three_months_sales = item.CYAUGSOLD + item.CYJULSOLD + item.CYJUNSOLD;
    ELSIF current_month = 10 THEN
        last_three_months_sales = item.CYSEPSOLD + item.CYAUGSOLD + item.CYJULSOLD;
    ELSIF current_month = 11 THEN
        last_three_months_sales = item.CYOCTSOLD + item.CYSEPSOLD + item.CYAUGSOLD;
    ELSE
        last_three_months_sales = item.CYNOVSOLD + item.CYOCTSOLD + item.CYSEPSOLD;
    END IF;

    RETURN last_three_months_sales;
END;
$$;

CREATE OR REPLACE FUNCTION get_last_four_month_sold(item Item) RETURNS INT
    LANGUAGE plpgsql
AS $$
DECLARE
    last_four_months_sales INT;
    current_month INT;
BEGIN
    -- Get the current month
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO current_month;

    -- Determine the sales for the last four months based on the current month
    IF current_month = 1 THEN
        last_four_months_sales = item.PYDECSOLD + item.PYNOVSOLD + item.PYOCTSOLD + item.PYSEPSOLD;
    ELSIF current_month = 2 THEN
        last_four_months_sales = item.CYJANSOLD + item.PYDECSOLD + item.PYNOVSOLD + item.PYOCTSOLD;
    ELSIF current_month = 3 THEN
        last_four_months_sales = item.CYFEBSOLD + item.CYJANSOLD + item.PYDECSOLD + item.PYNOVSOLD;
    ELSIF current_month = 4 THEN
        last_four_months_sales = item.CYMARSOLD + item.CYFEBSOLD + item.CYJANSOLD + item.PYDECSOLD;
    ELSIF current_month = 5 THEN
        last_four_months_sales = item.CYAPRSOLD + item.CYMARSOLD + item.CYFEBSOLD + item.CYJANSOLD;
    ELSIF current_month = 6 THEN
        last_four_months_sales = item.CYMAYSOLD + item.CYAPRSOLD + item.CYMARSOLD + item.CYFEBSOLD;
    ELSIF current_month = 7 THEN
        last_four_months_sales = item.CYJUNSOLD + item.CYMAYSOLD + item.CYAPRSOLD + item.CYMARSOLD;
    ELSIF current_month = 8 THEN
        last_four_months_sales = item.CYJULSOLD + item.CYJUNSOLD + item.CYMAYSOLD + item.CYAPRSOLD;
    ELSIF current_month = 9 THEN
        last_four_months_sales = item.CYAUGSOLD + item.CYJULSOLD + item.CYJUNSOLD + item.CYMAYSOLD;
    ELSIF current_month = 10 THEN
        last_four_months_sales = item.CYSEPSOLD + item.CYAUGSOLD + item.CYJULSOLD + item.CYJUNSOLD;
    ELSIF current_month = 11 THEN
        last_four_months_sales = item.CYOCTSOLD + item.CYSEPSOLD + item.CYAUGSOLD + item.CYJULSOLD;
    ELSIF current_month = 12 THEN
        last_four_months_sales = item.CYNOVSOLD + item.CYOCTSOLD + item.CYSEPSOLD + item.CYAUGSOLD;
    END IF;

    RETURN last_four_months_sales;
END;
$$;

