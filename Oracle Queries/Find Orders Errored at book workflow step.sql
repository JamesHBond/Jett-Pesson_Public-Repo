/*FIND ORDER NUMBERS ERRORED AT BOOK STEP*/
select       oh.order_number,
             oh.order_type,
             oh.orig_sys_document_ref,
             wf.item_key, 
             pa.activity_name
        from wf_item_activity_statuses wf,  
             wf_process_activities pa,  
             oe_order_headers_v oh
       where     1 = 1 
             and wf.activity_status = 'ERROR' 
             and pa.activity_name='BOOK_ORDER'
             and oh.flow_status_code='ENTERED'
             and wf.item_type = 'OEOH' 
             and oh.header_id = to_number(wf.item_key)  
             and wf.process_activity = pa.instance_id
             group by oh.order_number, oh.order_type,
             oh.orig_sys_document_ref, wf.item_key, pa.activity_name
             order by wf.item_key asc;