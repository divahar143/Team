require_relative '../run'
require_relative '../lib/team.rb'
require_relative '../helper/adapters_helper.rb'
require_relative '../helper/features_helper.rb'


describe "Team functionality" do

	before(:all) do
		login "gopi.ganesh@railsdata.com", "#Password1234567"
	end

	after(:all) do
		nil
	end

	it "TC004_Verify whether the default roles of Analyst, Admin and Operator are available in Roles section" do
		navigate_to_Team_section
		navigate_to_roles_section
		role_name_default_check
	end

	it "TC007_Verify account admin is not able to edit any of these Analyst, Admin and Operator roles" do
		navigate_to_Team_section
		navigate_to_roles_section
		default_role_edit
	end

	it "TC012_Verify account admin is able to see role created date and time" do
		navigate_to_Team_section
		navigate_to_roles_section
		default_role_edit
	end

	xit "TC014_Verify account admin is able to change the role type for an existing Collaborator using edit icon." do
		navigate_to_Team_section
		search_collaborators 'divahar'
		click_edit name
	end

	xit "TC015_Verify account admin is able to remove an existing Collaborator using delete icon." do
		navigate_to_Team_section
		search_collaborators 'divahar'
		click_delete
	end

	xit "TC016_Verify account admin is able to see an existing Collaborator’s last active status." do
		navigate_to_Team_section
		search_collaborators 'divahar'
	end

	xit "TC017_Verify account admin is able to search a particular collaborator with valid details." do
		navigate_to_Team_section
		search_collaborators 'divahar'
	end

end
