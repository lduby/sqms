class CreateAccessControlData < ActiveRecord::Migration
  def change
    adminuser = User.create! :name => 'Administrator', :email => 'admin@example.com', :password => 'Admln0', :password_confirmation => 'Admln0'
	tester = User.create! :name => 'Tester', :email => 'tester@example.com', :password => 'Test3r', :password_confirmation => 'Test3r'
	developer = User.create! :name => 'Developer', :email => 'dev@example.com', :password => 'Devlp3r', :password_confirmation => 'Devlp3r'
	analyst = User.create! :name => 'Analyst', :email => 'moa@example.com', :password => 'm0analysT', :password_confirmation => 'm0analysT'
	superuser = User.create! :name => 'Super User', :email => 'superuser@example.com', :password => 'Batman', :password_confirmation => 'Batman'
	analystrole = Role.create! :name => 'analyst'
	devrole = Role.create! :name => 'developer'
	testrole = Role.create! :name => 'tester'
	superrole = Role.create! :name => 'superuser'
	superuser.add_role :superuser
	adminuser.add_role :admin
	analyst.add_role :analyst
	developer.add_role :developer
	tester.add_role :tester
	usermngrights = Permission.create! :name => 'User management', :description => 'All operations on users', :action => 'manage', :subject_class => 'User'
	userreadrights = Permission.create! :name => 'User visualization', :description => 'Only read operations on users', :action => 'read', :subject_class => 'User'
	rolemngrights = Permission.create! :name => 'Role management', :description => 'All operations on roles', :action => 'manage', :subject_class => 'Role'
	rolereadrights = Permission.create! :name => 'Role visualization', :description => 'Only read operations on roles', :action => 'read', :subject_class => 'Role'
	permmngrights = Permission.create! :name => 'Permission management', :description => 'All operations on permissions', :action => 'manage', :subject_class => 'Permission'
	permreadrights = Permission.create! :name => 'Permission visualization', :description => 'Only read operations on permissions', :action => 'read', :subject_class => 'Permission'
	adminrole = Role.find_by_name("admin")
	adminrole.permissions << usermngrights
	adminrole.permissions << rolemngrights
	adminrole.permissions << permmngrights
  end
end
