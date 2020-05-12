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

	xit "TC016_Verify account admin is able to see an existing Collaborator’s last active status." do
		navigate_to_Team_section
		search_collaborators 'yogesh'
	end

	xit "TC017_Verify account admin is able to search a particular collaborator with valid details." do
		navigate_to_Team_section
		search_collaborators 'yogesh'
	end

	it "TC015_Verify account admin is able to remove an existing Collaborator using delete icon." do
		navigate_to_Team_section
		search_collaborators 'divahar'
		click_delete
	end

	it "TC014_Verify account admin is able to change the role type for an existing Collaborator using edit icon." do
		navigate_to_Team_section
		search_collaborators 'divahar'
		click_edit name
	end

end
