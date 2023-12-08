create function trigger_set_created_at() returns trigger
    language plpgsql
as
$$
BEGIN
  NEW.created_at = NOW();
  RETURN NEW;
END;
$$;

