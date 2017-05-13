name 'compute'
description 'Environment specifically for OpenStack compute nodes'
cookbook 'system_users', '= 0.1.0'
cookbook 'sudo_group', '= 0.1.0'
override_attributes('author' => {
                      'name' => 'Thomas Neilly'
                    })
