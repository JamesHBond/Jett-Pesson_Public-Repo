select replace(fpov.profile_option_value, substr(fpov.profile_option_value,-4),'/OA_HTML/OALogout.jsp?menu=Y')
from apps.fnd_profile_options fpo, apps.fnd_profile_options_tl fpot, apps.fnd_profile_option_values fpov, apps.fnd_user fu
where fpo.profile_option_id = fpov.profile_option_id
and fpov.level_id=10001
and fpov.last_updated_by=fu.user_id
and fpo.profile_option_name=fpot.profile_option_name
and fpot.language='US'
and fpo.profile_option_name in(
'APPS_FRAMEWORK_AGENT'
)
order by 1;