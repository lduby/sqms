namespace :rbac do
  desc "Generating all possible application permissions"
  task :setup_permissions => :environment do
	Permission.setup_actions_controllers_db
  end
  
  task :pick_winner => :environment do
    user = User.find(1)
    puts "Winner : #{user.name}"
  end
  
  desc "Creating a default admin user"
  task :default_users do
    puts 'SETTING UP DEFAULT USERS'
	adminuser = User.create! :name => 'Administrator', :email => 'adminuser@example.com', :password => 'Admln0', :password_confirmation => 'Admln0'
	puts 'New user created: ' << adminuser.name
	tester = User.create! :name => 'Tester', :email => 'tester@example.com', :password => 'Test3r', :password_confirmation => 'Test3r'
	puts 'New user created: ' << tester.name
	developer = User.create! :name => 'Developer', :email => 'dev@example.com', :password => 'Devlp3r', :password_confirmation => 'Devlp3r'
	puts 'New user created: ' << developer.name
	analyst = User.create! :name => 'Analyst', :email => 'moa@example.com', :password => 'm0analysT', :password_confirmation => 'm0analysT'
	puts 'New user created: ' << analyst.name
	superuser = User.create! :name => 'Super User', :email => 'superuser@example.com', :password => 'Batman', :password_confirmation => 'Batman'
	puts 'New user created: ' << superuser.name
  end
  
  desc "Creating default roles"
  task :default_roles do
    puts 'SETTING UP DEFAULT ANALYST ROLE'
	analystrole = Role.create! :name => 'Analyst'
	puts 'New role created: ' << analystrole.name
    puts 'SETTING UP DEFAULT DEVELOPER ROLE'
	devrole = Role.create! :name => 'Developer'
	puts 'New role created: ' << devrole.name
    puts 'SETTING UP DEFAULT TESTER ROLE'
	testrole = Role.create! :name => 'Tester'
	puts 'New role created: ' << testrole.name
    puts 'SETTING UP DEFAULT ADMIN ROLE'
	adminrole = Role.create! :name => 'Admin'
	puts 'New role created: ' << adminrole.name
    puts 'SETTING UP DEFAULT SUPERUSER ROLE'
	superrole = Role.create! :name => 'Super User'
	puts 'New role created: ' << superrole.name
  end
  
  desc "Creating application permissions"
  task :create_permissions do
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
	storymngrights = Permission.create! :name => 'User story management', :description => 'All operations on user stories', :action => 'manage', :subject_class => 'Story'
	puts 'New permission created: ' << storymngrights.name
    storyreadrights = Permission.create! :name => 'User story visualization', :description => 'Only read operations on user stories', :action => 'read', :subject_class => 'Story'
	puts 'New permission created: ' << storyreadrights.name
  end
    
  desc "Setup database with default data"
  task :setup_db => :environment do
    puts 'SETTING UP DEFAULT USERS'
    adminuser = User.create! :name => 'Administrator', :email => 'adminuser@example.com', :password => 'Admln0', :password_confirmation => 'Admln0'
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
	analystrole = Role.create! :name => 'Analyst'
	puts 'New role created: ' << analystrole.name
	devrole = Role.create! :name => 'Developer'
	puts 'New role created: ' << devrole.name
	testrole = Role.create! :name => 'Tester'
	puts 'New role created: ' << testrole.name
	adminrole = Role.create! :name => 'Admin'
	puts 'New role created: ' << adminrole.name
	superrole = Role.create! :name => 'Super User'
	puts 'New role created: ' << superrole.name
	puts 'ASSOCIATING ROLES TO USERS'
	superuser.roles << superrole
	adminuser.roles << adminrole
	analyst.roles << analystrole
	developer.roles << devrole
	tester.roles << testrole
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
	storymngrights = Permission.create! :name => 'User story management', :description => 'All operations on user stories', :action => 'manage', :subject_class => 'Story'
	puts 'New permission created: ' << storymngrights.name
    storyreadrights = Permission.create! :name => 'User story visualization', :description => 'Only read operations on user stories', :action => 'read', :subject_class => 'Story'
	puts 'New permission created: ' << storyreadrights.name
	puts 'ASSOCIATING PERMISSIONS TO ROLES'
	adminrole.permissions << usermngrights
	adminrole.permissions << rolemngrights
	adminrole.permissions << permmngrights
	analystrole.permissions << storymngrights
	devrole.permissions << storyreadrights
	testrole.permissions << storyreadrights
  end

end
