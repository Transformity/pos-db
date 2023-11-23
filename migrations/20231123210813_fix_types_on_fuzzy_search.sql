CREATE EXTENSION if not exists pg_trgm;
SET pg_trgm.word_similarity_threshold = 0.40;

-- old name
drop function if exists fuzzy_search_item(_search_term text, _item item);

drop function if exists has_fuzzy_search_item(_search_term text, _item item);
create function has_fuzzy_search_item(_search_term text, _item item)
    returns boolean
    language plpgsql
as
$$
BEGIN
    RETURN
        _search_term is null
         OR (_search_term <% coalesce(text(_item.description), '')
         OR _search_term <% coalesce(text(_item.barcode), '')
        OR _search_term <% coalesce(text(_item.barcode2), '')
          OR _search_term <% coalesce(text(_item.barcode3), '')
          OR _search_term <% coalesce(text(_item.barcode4), '')
             OR _search_term <% coalesce(text(_item.size1), ''));
END;
$$;


drop function if exists fuzzy_search_item_and_parent(_search_term text, _entity_id bigint);
create function fuzzy_search_item_and_parent(_search_term text, _entity_id bigint)
    returns setof item
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        i.*
    FROM item i
    LEFT JOIN item parent on i.subparentitemseqno = parent.itemseqno
    WHERE i.entity_id = _entity_id
    AND (has_fuzzy_search_item(_search_term, i) OR has_fuzzy_search_item(_search_term, parent))
    ORDER BY i.description <-> _search_term;
END;
$$;
