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



################################################################
########## -------------- Layer 2 -------------- ###############
################################################################

def navigate_to_Team_section
  sleep 1
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

################################################################
########## -------------- API Response -------------- ##########
################################################################


################## FeaturesHelper ##################
