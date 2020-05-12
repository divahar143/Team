public

################################################################
########## -------------- Top Layer -------------- #############
################################################################

def search_collaborators user
  search_click_collaborator
  search_input_collaborator user
  binding.pry
end



################################################################
########## -------------- Layer 1 -------------- ###############
################################################################

def login user, password
  click_login user, password
end

def default_role_edit
  search_input_collaborator 'Admin'
  if role_editor 'Admin'== nil
    puts "Admin role doesn't have edit function"
  end
  search_input_collaborator 'Analyst'
  a = role_editor 'Analyst'
  if a == nil
    puts "Analyst role doesn't have edit function"
  end
  search_input_collaborator 'Operator'
  a = role_editor 'Operator'
  if a == nil
    puts "Operator role doesn't have edit function"
  end


end


################################################################
########## -------------- Layer 2 -------------- ###############
################################################################

def navigate_to_Team_section
  sleep 2
  find(:xpath,"//span[contains(text(),'Tools')]").click
  sleep 1
  click_link 'Team'
end

def click_login user, password
  visit base_url + "users/sign_in"
  fill_in 'user[email]', user
  fill_in 'user[password]', password
  click_button
end

def search_click_collaborator
  sleep 1
  find(:xpath,"//input").click
end

def search_input_collaborator user
  sleep 1
  find(:xpath,"//input").send_keys user
end

def navigate_to_roles_section
  sleep 2
  find(:xpath,"//a[@href='#roles']").click
end

def role_name_default_check
  "Admin"     ==  find(:xpath,"//div[contains(@class,'team-roles__cell')]/span[text()='Admin']").text
  "Analyst"   ==  find(:xpath,"//div[contains(@class,'team-roles__cell')]/span[text()='Analyst']").text
  "Operator"  ==  find(:xpath,"//div[contains(@class,'team-roles__cell')]/span[text()='Operator']").text
  puts 'Admin, Analyst and Operator roles are available'
end

def role_editor user
  sleep 1
  find(:xpath,"(//span[text()='#{user}']/following::w-svg-icon[@iconid='pencil'])[1]").click
end




################## FeaturesHelper ##################
