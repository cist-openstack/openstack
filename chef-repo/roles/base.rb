name 'base'
description 'Base role for all SnapStack nodes'
run_list 'recipe[system_users]', 'recipe[sudo_group]', 'recipe[base_node]'
