create or replace function match_fintech_to_item(_case_upc text, _clean_upc text, _pack_upc text, _entity_id bigint) returns SETOF item
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        select *
        from item i
        where
            i.entity_id = _entity_id and i.status='ACTIVE' and (
--     exact lookup
                    (_case_upc IS NOT NULL AND (barcode=_case_upc or barcode2=_case_upc)) or
                    (_clean_upc IS NOT NULL AND (barcode=_clean_upc or barcode2=_clean_upc)) or
                    (_pack_upc IS NOT NULL AND (barcode=_pack_upc or barcode2=_pack_upc)) or
--     like lookup on full string
                    (_case_upc IS NOT NULL AND (barcode like concat('%', _case_upc, '%') or barcode2 like concat('%', _case_upc, '%'))) or
                    (_clean_upc IS NOT NULL AND (barcode like concat('%', _clean_upc, '%') or barcode2 like concat('%', _clean_upc, '%'))) or
                    (_pack_upc IS NOT NULL AND (barcode like concat('%', _pack_upc, '%') or barcode2 like concat('%', _pack_upc, '%'))) or
--     remove first char
                    (_case_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_case_upc, 2, length(_case_upc)), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 2, length(_case_upc)), '%'))) or
                    (_clean_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_clean_upc, 2, length(_clean_upc)), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 2, length(_clean_upc)), '%'))) or
                    (_pack_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_pack_upc, 2, length(_pack_upc)), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 2, length(_pack_upc)), '%'))) or
--     remove first 2 chars - NEEDED
                    (_case_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_case_upc, 3, length(_case_upc)), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 3, length(_case_upc)), '%'))) or
                    (_clean_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_clean_upc, 3, length(_clean_upc)), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 3, length(_clean_upc)), '%'))) or
                    (_pack_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_pack_upc, 3, length(_pack_upc)), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 3, length(_pack_upc)), '%'))) or
--     take off last 1 char
--                     barcode like concat('%', SUBSTRING(_case_upc, 1, length(_case_upc) - 1), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 1, length(_case_upc) - 1), '%') or
--                     barcode like concat('%', SUBSTRING(_clean_upc, 1, length(_clean_upc) - 1), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 1, length(_clean_upc) - 1), '%') or
--                     barcode like concat('%', SUBSTRING(_pack_upc, 1, length(_pack_upc) - 1), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 1, length(_pack_upc) - 1), '%') or
--     take off first 3 chars and last 1 char for Little Rooster when first are 00 - NEEDED
                    (_case_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_case_upc, 4, length(_case_upc) - 4), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 4, length(_case_upc) - 4), '%'))) or
                    (_clean_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_clean_upc, 4, length(_clean_upc) - 4), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 4, length(_clean_upc) - 4), '%'))) or
                    (_pack_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_pack_upc, 4, length(_pack_upc) - 4), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 4, length(_pack_upc) - 4), '%'))) or
--     take off first 1 and last 1 char for Little Rooster when first are not 00 - NEEDED
                    (_case_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_case_upc, 2, length(_case_upc) - 2), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 2, length(_case_upc) - 2), '%'))) or
                    (_clean_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_clean_upc, 2, length(_clean_upc) - 2), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 2, length(_clean_upc) - 2), '%'))) or
                    (_pack_upc IS NOT NULL AND (barcode like concat('%', SUBSTRING(_pack_upc, 2, length(_pack_upc) - 2), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 2, length(_pack_upc) - 2), '%'))));
--     take off first 2 and last 1 char
--                     barcode like concat('%', SUBSTRING(_case_upc, 3, length(_case_upc) - 3), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 3, length(_case_upc) - 3), '%') or
--                     barcode like concat('%', SUBSTRING(_clean_upc, 3, length(_clean_upc) - 3), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 3, length(_clean_upc) - 3), '%') or
--                     barcode like concat('%', SUBSTRING(_pack_upc, 3, length(_pack_upc) - 3), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 3, length(_pack_upc) - 3), '%') or
--     take off first 1 and last 2 char
--                     barcode like concat('%', SUBSTRING(_case_upc, 2, length(_case_upc) - 3), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 2, length(_case_upc) - 3), '%') or
--                     barcode like concat('%', SUBSTRING(_clean_upc, 2, length(_clean_upc) - 3), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 2, length(_clean_upc) - 3), '%') or
--                     barcode like concat('%', SUBSTRING(_pack_upc, 2, length(_pack_upc) - 3), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 2, length(_pack_upc) - 3), '%') or
--     take off first 2 and last 2 char
--                     barcode like concat('%', SUBSTRING(_case_upc, 3, length(_case_upc) - 4), '%') or barcode2 like concat('%', SUBSTRING(_case_upc, 3, length(_case_upc) - 4), '%') or
--                     barcode like concat('%', SUBSTRING(_clean_upc, 3, length(_clean_upc) - 4), '%') or barcode2 like concat('%', SUBSTRING(_clean_upc, 3, length(_clean_upc) - 4), '%') or
--                     barcode like concat('%', SUBSTRING(_pack_upc, 3, length(_pack_upc) - 4), '%') or barcode2 like concat('%', SUBSTRING(_pack_upc, 3, length(_pack_upc) - 4), '%'));
END;
$$;

