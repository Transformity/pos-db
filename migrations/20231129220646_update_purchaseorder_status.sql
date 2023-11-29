-- Update the status of a purchase order when all items are received
CREATE OR REPLACE FUNCTION update_purchaseorder_status()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if the status is 'received'
  IF NEW.status = 'received'::purchaseorderitems_status THEN
    -- Check if all related items in purchaseorderitems have 'received' status
    IF (SELECT CASE WHEN COUNT(*) = 0 THEN true ELSE false END
        FROM purchaseorderitems
        WHERE poid = NEW.poid AND status <> 'received'::purchaseorderitems_status) THEN
      -- Update the purchaseorders table
      UPDATE purchaseorders
      SET status = 'received'::purchaseorders_status
      WHERE id = NEW.poid;
    END IF;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger function for the purchaseorderitems table to update the status of the purchaseorders table
-- after an insert or update
DROP TRIGGER IF EXISTS trigger_update_purchaseorder_status ON purchaseorderitems;
CREATE TRIGGER trigger_update_purchaseorder_status
AFTER UPDATE OR INSERT ON purchaseorderitems
FOR EACH ROW
EXECUTE FUNCTION update_purchaseorder_status();

