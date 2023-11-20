CREATE EXTENSION if not exists pg_trgm;
SET pg_trgm.similarity_threshold = 0.20;


drop function if exists fuzzy_search_item(_search_term text, _item item);
create function fuzzy_search_item(_search_term text, _item item)
    returns boolean
    language plpgsql
as
$$
BEGIN
    RETURN
        _search_term is null
         OR (_search_term <% coalesce(text(_item.description), '')
         OR _search_term % coalesce(text(_item.description), '')
         OR _search_term <% coalesce(text(_item.barcode), '')
         OR _search_term % coalesce(text(_item.barcode), '')
        OR _search_term <% coalesce(text(_item.barcode2), '')
            OR _search_term % coalesce(text(_item.barcode2), '')
          OR _search_term <% coalesce(text(_item.barcode3), '')
            OR _search_term % coalesce(text(_item.barcode3), '')
          OR _search_term <% coalesce(text(_item.barcode4), '')
            OR _search_term % coalesce(text(_item.barcode4), '')
             OR _search_term <% coalesce(text(_item.size1), '')
             OR _search_term % coalesce(text(_item.size1), ''));
END;
$$;


drop function if exists fuzzy_search_item_and_parent(_search_term text, _entity_id integer);
create function fuzzy_search_item_and_parent(_search_term text, _entity_id integer)
    returns TABLE(id int, description text, barcode1 text, barcode2 text, barcode3 text, barcode4 text, size1 text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        i.itemseqno AS id,
        text(i.description),
        text(i.barcode),
        text(i.barcode2),
        text(i.barcode3),
        text(i.barcode4),
        text(i.size1)
    FROM item i
    LEFT JOIN item parent on i.subparentitemseqno = parent.itemseqno
    WHERE i.entity_id = _entity_id
    AND (fuzzy_search_item(_search_term, i) OR fuzzy_search_item(_search_term, parent))
    ORDER BY i.description <-> _search_term
    LIMIT 10;
END;
$$;