select fu.user_name, fu.description, fr.responsibility_Name, fa.application_name
from FND_USER_RESP_GROUPS_ALL fg, FND_RESPONSIBILITY_VL fr, fnd_user fu, fnd_application_tl fa
where fg.responsibility_id=fr.responsibility_id
and fg.user_id=fu.user_id
and fr.application_Id=fa.application_id
and fg.end_date is null
and fu.user_name <> 'AUTOINSTALL'
and fu.end_date is null
and fu.user_Name='JAPESSON'
order by user_Name, responsibility_Name;