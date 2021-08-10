/*GET OPEN SERIAL NUMS*/
select msn.inventory_item_id, msn.serial_number, msn.creation_date, msn.last_update_date, 
msn.last_updated_by, msn.current_status, fv.meaning as "STATUS_MEANING"
from   mtl_serial_numbers msn, fnd_lookup_values_vl fv
where msn.current_status=fv.lookup_code
and fv.lookup_type='SERIAL_NUM_STATUS'
and current_status = 3;