
#set :app_eip, '3.112.148.47'

set :ssh_options, {
    keys: [File.expand_path('~/.ssh/EbitenpuraAppKey.pem')],
    forward_agent: true,
    auth_methods: %w(publickey)
}

role :app, 'ec2-user@13.230.220.82'
role :web, 'ec2-user@13.230.220.82'
role :db,  'ec2-user@13.230.220.82'


#set :default_env, {
#rbenv_root: "/opt/rbenv"
#}


#server '13.230.220.82', user: 'admin', roles: %w{web app db}

#set :ssh_options, {
#keys: [File.expand_path('~/.ssh/new_rsa')],
#forward_agent: true,
#auth_methods: %w(publickey)
#}

