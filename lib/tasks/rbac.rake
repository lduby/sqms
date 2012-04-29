namespace :rbac do
desc "Setup database with RBAC default data"
  task :setup_db => :environment do
    puts 'SETTING UP DEFAULT USERS'
    adminuser = User.create! :name => 'Administrator', :email => 'admin@example.com', :password => 'Admln0', :password_confirmation => 'Admln0'
	puts 'New user created: ' << adminuser.name
	tester = User.create! :name => 'Tester', :email => 'tester@example.com', :password => 'Test3r', :password_confirmation => 'Test3r'
	puts 'New user created: ' << tester.name
	developer = User.create! :name => 'Developer', :email => 'dev@example.com', :password => 'Devlp3r', :password_confirmation => 'Devlp3r'
	puts 'New user created: ' << developer.name
	analyst = User.create! :name => 'Analyst', :email => 'moa@example.com', :password => 'm0analysT', :password_confirmation => 'm0analysT'
	puts 'New user created: ' << analyst.name
	superuser = User.create! :name => 'Super User', :email => 'superuser@example.com', :password => 'Batman', :password_confirmation => 'Batman'
	puts 'New user created: ' << superuser.name
	puts 'SETTING UP DEFAULT ROLES'
	analystrole = Role.create! :name => 'analyst'
	puts 'New role created: ' << analystrole.name
	devrole = Role.create! :name => 'developer'
	puts 'New role created: ' << devrole.name
	testrole = Role.create! :name => 'tester'
	puts 'New role created: ' << testrole.name
	superrole = Role.create! :name => 'superuser'
	puts 'New role created: ' << superrole.name
	puts 'ASSOCIATING ROLES TO USERS'
	superuser.add_role :superuser
	adminuser.add_role :admin
	analyst.add_role :analyst
	developer.add_role :developer
	tester.add_role :tester
	puts 'SETTING UP PERMISSIONS'
	usermngrights = Permission.create! :name => 'User management', :description => 'All operations on users', :action => 'manage', :subject_class => 'User'
	puts 'New permission created: ' << usermngrights.name
    userreadrights = Permission.create! :name => 'User visualization', :description => 'Only read operations on users', :action => 'read', :subject_class => 'User'
	puts 'New permission created: ' << userreadrights.name
    rolemngrights = Permission.create! :name => 'Role management', :description => 'All operations on roles', :action => 'manage', :subject_class => 'Role'
	puts 'New permission created: ' << rolemngrights.name
    rolereadrights = Permission.create! :name => 'Role visualization', :description => 'Only read operations on roles', :action => 'read', :subject_class => 'Role'
	puts 'New permission created: ' << rolereadrights.name
	permmngrights = Permission.create! :name => 'Permission management', :description => 'All operations on permissions', :action => 'manage', :subject_class => 'Permission'
	puts 'New permission created: ' << permmngrights.name
    permreadrights = Permission.create! :name => 'Permission visualization', :description => 'Only read operations on permissions', :action => 'read', :subject_class => 'Permission'
	puts 'New permission created: ' << permreadrights.name
	puts 'ASSOCIATING PERMISSIONS TO ROLES'
	adminrole = Role.find_by_name("admin")
	adminrole.permissions << usermngrights
	adminrole.permissions << rolemngrights
	adminrole.permissions << permmngrights
  end

end
