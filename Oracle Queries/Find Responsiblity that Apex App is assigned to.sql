SELECT
    fmel.prompt,
    fmel.entry_sequence,
    frv.responsibility_name
FROM
    fnd_form_functions_vl  fffv,
    fnd_menu_entries_vl    fmel,
    fnd_responsibility_vl  frv
WHERE
        function_name = ( (
            SELECT
                function_name
            FROM
                fnd_form_functions_vl
            WHERE
                web_html_call IS NOT NULL
                AND upper(web_html_call) LIKE '%APEX%'
                AND substr(
                    web_html_call,
                    30,
                    3
                ) = :enter_apex_app_id
        ) )
    AND fffv.function_id = fmel.function_id
    AND frv.menu_id = fmel.menu_id;