public

################################################################
########## -------------- Top Layer -------------- #############
################################################################

def callable_trigger_app
  callable_trigger_app_select
  callable_recipe_name 'Get_method_for_test1'
  input_response_schema_values 'value01','value02'
end

def logger_action_app
  logger_action_app_select
  logger_message 'Message for Get method test'
  callable_action_return_response
end

def callable_trigger_app_using_expert
  click_button "I'm an expert. Skip"
  callable_trigger_app_expert
  callable_recipe_name 'Get_method_for_test1'
  add_input_schema "value01"
  add_response_schema "value02"
end

def logger_action_app_using_expert
  logger_action_app_expert
  logger_message_expert 'Message for Get method test'
  # add_new_action
end

################################################################
########## -------------- Layer 1 -------------- ###############
################################################################

def create_new_recipe_click_event
  navigate_to_home
  sleep 2
  click_link 'Create a new recipe'
  sleep 1
end

def login user, password
  click_login user, password
end

def recipe_folder folder_name="Home"
  create_new_recipe_button_click folder_name
end

def callable_trigger_app_select
  adapter_select 'Callable'
  sleep 1
  click_button 'Next'
end

def adapter_select app_name
  choose_adapter app_name
end

def callable_recipe_name name
  name_for_callable_recipe name
end

def input_response_schema_values input, response
  add_input_schema input
  add_response_schema response
  sleep 1
  click_button 'Next'
end

def logger_action_app_select
  adapter_select 'Logger'
  sleep 1
  click_button 'Next'
end

def recipe_dialog_close
  close_recipe_popup
end

def navigate_to_API_collections collection
  navigate_to_API_section
  sleep 1
  click_on_API_collection collection
end

def callable_action_return_response
  sleep 1
  recipe_dialog_close
  add_new_action
end

def create_new_API_collection name,version,description,folder_name
  navigate_to_API_section
  click_button 'Add new API collection'
  create_api_collection name,version,description,folder_name
end

def navigate_to_get_endpoint endpoint
  click_on_endpoint endpoint
end

def navigate_to_post_endpoint
  click_on_API_collection 'collection_1'
  click_on_endpoint 'Endpoint_2'
end

def copying_api_token_from_client client_name,profile
  back_to_API_collection
  navigate_to_clients_section
  click_on_client client_name
  copying_API_token profile
  Clipboard.paste
end

def new_access_profile_api_token client_name, name,collection,policy,type
  back_to_API_collection
  navigate_to_clients_section
  click_on_client client_name
  new_access_profile name,collection,policy,type
  copying_API_token name
  Clipboard.paste
end

def create_policy name,r_time,r_request,u_time,u_request
  sleep 1
  click_link 'API collections'
  sleep 1
  click_link 'Policies'
  sleep 1
  create_new_policy
  create_new_policy_name name,r_time,r_request,u_time,u_request
end

################################################################
########## -------------- Layer 2 -------------- ###############
################################################################

def click_login user, password
  visit base_url + "users/sign_in"
  fill_in 'user[email]', user
  fill_in 'user[password]', password
  click_button
end

def create_new_recipe_button_click folder_name
  sleep 2
  find(:xpath,"(//w-svg-icon[contains(@class,'folders__folder-expand')])").click
  sleep 0.5
  find(:xpath,"(//span[contains(text(),'#{folder_name}')])[1]").click
  sleep 1
end

def choose_adapter app_name
  # sleep 2
  # find(:xpath, "//w-select/div/input").send_keys app_name
  sleep 1
  # find(:xpath,"(//w-adapter-select-option[@class='ng-star-inserted'])[1]").click
  # find(:xpath,"(//w-select-option[contains(@class,'select-dropdown')])[1]").click
  select_adapter(app_name, line_type = nil, strict: false)
  # sleep 1
  # find(:css,".w-select__filter").send_keys :enter
  # sleep 1
  #   find(:xpath,"//w-select-option/div/span/span[contains(text(), '#{app_name}')]/../../../..").send_keys :tab
  # begin
  #   find(:xpath,"(//div[contains(@class,'select-dropdown')])[2]").click
  #   sleep 0.5
  # rescue => ex
  #   i ||= 0
  #   sleep 1
  #   i += 1
  #   retry if i < 3
  # end
  #
  # sleep 1
end

def name_for_callable_recipe name
  sleep 2
  find(:xpath,"(//input[contains(@id,'service_name')]/following::div)[5]").click
  sleep 0.5
  find(:xpath,"(//input[contains(@id,'service_name')]/following::div)[5]").click
  sleep 0.5
  find(:xpath, "//input[contains(@id, 'service_name')]/following::textarea", false).send_keys name
end

def add_input_schema input
  find(:xpath,"(//button[contains(text(),'add fields')])[1]").click
  sleep 1
  find(:xpath,"(//input[contains(@id,'name')])[2]").set input
  find(:xpath,"(//span[contains(text(),'Add field')]/ancestor::button)").click
  sleep 1
end

def add_response_schema response
  find(:xpath,"(//button[contains(text(),'add fields')])[1]").click
  sleep 1
  find(:xpath,"(//input[contains(@id,'name')])[2]").set response
  find(:xpath,"(//span[contains(text(),'Add field')]/ancestor::button)").click
  sleep 1
end

def logger_message message
  sleep 1
  find(:xpath,"(//input[contains(@id,'message')]/following::div)[5]").click
  sleep 1
  find(:xpath, "//input[contains(@id,'message')]/following::textarea", false).send_keys message
  sleep 0.5
  click_button 'Finish'
end

def logger_message_expert message
  sleep 1
  find(:xpath,"(//input[contains(@id,'message')]/following::div)[5]").click
  sleep 0.5
  find(:xpath,"(//input[contains(@id,'message')]/following::div)[5]").click
  sleep 1
  find(:xpath, "//input[contains(@id,'message')]/following::textarea", false).send_keys message
  sleep 0.5
end

def close_recipe_popup
  sleep 1
  find(:xpath,"//button[contains(@class,'w-dialog__close')]").click
end

def navigate_to_API_section
  sleep 1
  find(:xpath,"//span[contains(text(),'Tools')]").click
  sleep 1
  click_link 'API platform'
  sleep 1
  click_link 'API collections'
end


def create_api_collection name,version,description,folder_name
  sleep 1
  find(:xpath,"(//label[contains(text(),'Collection name')]/following::div)[8]").click
  find(:xpath,"(//input[contains(@id,'name')]/following::textarea)[1]",false).send_keys name
  sleep 1
  find(:xpath,"(//label[contains(text(),'Version')]/following::div)[8]").click
  find(:xpath,"(//input[contains(@id,'version')]/following::textarea)[1]",false).send_keys version
  sleep 1
  find(:xpath,"(//label[contains(text(),'Description')]/following::div)[8]").click
  find(:xpath,"(//input[contains(@id,'description')]/following::textarea)[1]",false).send_keys description
  sleep 1
  find(:xpath,"(//label[contains(text(),'Recipe folder')]/following::div)[4]").click
  find(:xpath,"//input[contains(@class,'tree-select')]",false).send_keys folder_name
  sleep 0.5
  find(:xpath,"(//div[contains(@class,'tree-select')])[8]").click
  sleep 1
  click_button 'Next'
  sleep 1
  click_button 'Create API collection'
  sleep 3
end

def create_new_endpoint endpoint_name,recipe_name=nil,method,path
  click_button 'Create new endpoint'
  sleep 1
  find(:xpath,"(//label[contains(text(),'Name')]/following::div)[8]").click
  find(:xpath,"(//input[contains(@id,'name')]/following::textarea)[1]",false).send_keys endpoint_name
  find(:xpath,"(//label[contains(text(),'Callable recipe')]/following::div)[4]").click
  # find(:xpath,"(//input[contains(@class,'w-select__filter')])[1]",false).send_keys recipe_name
  sleep 1
  find(:xpath,"(//w-select-option[contains(@class,'select-dropdown')])[1]").click
  sleep 0.5
  find(:xpath,"(//label[contains(text(),'Method')]/following::div)[4]").click
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[2]",false).send_keys method
  sleep 1
  find(:xpath,"//w-select-dropdown").click
  find(:xpath,"(//label[contains(text(),'Path')]/following::div)[4]").click
  sleep 0.2
  find(:xpath,"(//label[contains(text(),'Path')]/following::div)[4]").click
  sleep 0.5
  find(:xpath,"(//input[contains(@id,'path')]/following::textarea)[1]",false).send_keys path
  sleep 1
  click_button 'Add endpoint'
  sleep 1
  click_on_endpoint endpoint_name
  enable_endpoint
end

def enable_endpoint
  find(:xpath,"//span[contains(@class,'switch-control')]").click
end

def add_new_action
  sleep 1.5
  find(:xpath,"//button[contains(@class, 'add-step__trigger')]").click
  sleep 0.5
  find(:xpath,"//span[contains(text(),'Action in an app')]").click
  sleep 1
  adapter_select 'Callable'
  sleep 1
  # find(:xpath,"(//div[contains(@class,'w-select__value')])[2]").click
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[2]").send_keys "Return response from recipe"
  sleep 1.5
  find(:xpath,"//w-select-dropdown[contains(@class,'w-select__dropdown')]").click
  sleep 1
  find(:xpath,"//div[@class='CodeMirror-lines']").click
  sleep 1
  find(:xpath,"//div[@class='CodeMirror-lines']").click
  sleep 1
  find(:xpath,"//span[text()='New call for recipe']").click
  sleep 1
  find(:xpath,"//span[text()='Recipe input']").click
  sleep 1
  find(:xpath,"//div[@class='CodeMirror-lines']").click
  sleep 0.5
  find(:xpath,"//span[text()='Value 01']").click
end

def start_recipe
  sleep 1
  click_button 'Save changes'
  sleep 1
  find(:xpath,"(//button[contains(@class,'button_default')])[5]").click
  sleep 0.5
  find(:xpath,"(//button[contains(@class,'button_default')])[6]").click
end

def open_tools_menu
  sleep 1
  find(:xpath,"//span[contains(text(),'Tools')]").click
  sleep 1
end

def click_on_API_collection collection_name
  sleep 1
  find(:xpath, "//h2[contains(text(),'#{collection_name}')]/parent::a").click
end

def click_on_endpoint endpoint_name
  sleep 1
  find(:xpath,"//h2[contains(text(),'#{endpoint_name}')]/ancestor::a").click
  sleep 2
end

def new_access_profile name,collection,policy,type
  sleep 1
  click_button 'Create access profile'
  sleep 1
  find(:xpath,"(//label[contains(text(),'Name')]/following::div)[8]").click
  find(:xpath,"(//input[contains(@id,'name')]/following::textarea)[1]",false).send_keys name
  find(:xpath,"(//label[contains(text(),'API collections')]/following::div)[3]").click
  sleep 0.5
  find(:xpath,"//input[contains(@class,'multi-select__search')]").send_keys collection
  sleep 0.5
  pick_from_dropdown collection
  sleep 0.5
  click_button 'OK'
  sleep 1
  find(:xpath,"(//label[contains(text(),'Policy')]/following::div)[3]").click
  sleep 0.2
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[1]").send_keys policy
  pick_from_dropdown policy
  sleep 0.5
  find(:xpath,"(//label[contains(text(),'Authentication method')]/following::div)[4]").click
  sleep 0.5
  find(:xpath,"(//input[contains(@class,'w-select')])[2]").send_keys type
  pick_from_dropdown type
  sleep 0.5
  click_button 'Add profile'
end

def create_new_policy
  sleep 0.5
  find(:css,".api-policy__create-icon").click
end

def create_new_policy_name name,r_time,r_request,u_time,u_request
  sleep 0.5
  find(:xpath,"(//input[contains(@id,'name')]/following::div)[5]").click
  sleep 0.5
  find(:xpath,"//input[contains(@id,'name')]/following::textarea",false).send_keys name
  sleep 1
  find(:xpath,"//w-select[contains(@data-field-id,'rate_limits')]/div").click
  sleep 1
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[1]").send_keys r_time
  sleep 1
  find(:xpath,"//w-select-dropdown[contains(@class,'w-select__dropdown')]").click
  sleep 1
  find(:xpath,"(//div[contains(@class,'form-field__input-wrapper')])[3]/div/w-text-field/div/div/div").click
  sleep 1
  find(:xpath,"(//div[@class='w-text-field__control'])[2]").click
  sleep 1
  find(:xpath,"(//div[contains(@class,'form-field__input-wrapper')])[3]/div/w-text-field/div/div/div").send_keys r_request
  sleep 1
  binding.pry
  find(:xpath,"(//div[contains(@class,'CodeMirror-lines')]/following::textarea)[1]", false).send_keys r_request
  sleep 1
  find(:xpath,"//w-select[contains(@data-field-id,'quota.interval')]/div").click
  sleep 1
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[2]").send_keys u_time
  sleep 1
  find(:xpath,"//w-select-dropdown[contains(@class,'w-select__dropdown')]").click
  sleep 1
  find(:xpath,"(//div[contains(@class,'form-field__input-wrapper')])[5]").click
  sleep 1
  find(:xpath,"(//div[contains(@class,'CodeMirror-lines')]/following::textarea)[2]", false).send_keys u_request
  # find(:xpath,"(//label[contains(text(),'Rate')]/following::div)[13]").click
  # sleep 1
  # find(:xpath,"(//label[contains(text(),'Rate')]/following::input)[1]",false).send_keys r_time
  # sleep 1
  # find(:xpath,"//w-select-dropdown[contains(@class,'ng-star-inserted')]").click
  # sleep 1
  # # find(:xpath,"(//label[contains(text(),'Number of requests')]/following::div)[19]").click
  # sleep 2
  # find(:xpath,"(//div[@class='CodeMirror-lines'])[2]")
  # sleep 1
  # find(:xpath,"(//label[contains(text(),'Rate')]/following::textarea)[1]",false).send_keys r_request
  # sleep 1
  # find(:xpath,"(//label[contains(text(),'Usage')]/following::div)[13]").click
  # sleep 1
  # find(:xpath,"(//label[contains(text(),'Usage')]/following::input)[1]",false).send_keys u_time
  # sleep 1
  # find(:xpath,"//w-select-dropdown[contains(@class,'ng-star-inserted')]").click
  # sleep 1
  # find(:xpath,"(//label[contains(text(),'Usage')]/following::div)[26]").click
  # sleep 1
  # find(:xpath,"(//label[contains(text(),'Usage')]/following::textarea)",false).send_keys u_request
  # sleep 1
  click_button 'Create policy'
end


def pick_from_dropdown text
  sleep 1
  find(:xpath,"//span[text()='#{text}']/ancestor::w-select-dropdown").click
end

def get_url_and_method
  sleep 1
  curl = get_text_of_cURL_statement
  {
    uri: (get_curl curl),
    method_name: (curl_method curl)
  }
end

def post_url_and_method
  sleep 1
  curl = get_text_of_cURL_statement
  {
    uri: (post_curl curl),
    method_name: (curl_method curl)
  }
end

def get_text_of_cURL_statement
  sleep 1
  find(:xpath,"(//strong[contains(text(),'cURL')]/following::code)[1]").text(:all)
end

def get_curl curl
  curl.match(/'(http.*?)\?/)[-1]
end

def post_curl curl
  curl.match(/'(https.*)'/)[-1]
end

def curl_method curl
  curl.match(/-X(.*?)\ /)[-1]
end

#Navigation for collection, client tab
def back_to_API_collection
  sleep 1
  click_link 'API collections'
end

def navigate_to_clients_section
  sleep 1
  click_link "Clients"
end

def click_on_client client_name
  sleep 1
  click_link client_name
end

#copying API token
def copying_API_token profile
  sleep 1
  find(:xpath,"(//h2[text()='#{profile}']/following::button)[1]").click
end

def navigate_to_home
  sleep 1
  find(:xpath,"//a[contains(@class,'w-logo')]").click
  sleep 1
end

def callable_trigger_app_expert
  sleep 1
  find(:xpath,"(//div[@class='recipe-step__header'])[1]").click
  sleep 1
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[1]").send_keys("Callable")
  sleep 1
  # find(:xpath,"//span[contains(text(),'Callable')]").click
  find(:css,".w-select__filter").send_keys :enter
end

def logger_action_app_expert
  sleep 1
  find(:xpath,"(//div[@class='recipe-step__header'])[2]").click
  sleep 1
  find(:xpath,"(//input[contains(@class,'w-select__filter')])[1]").send_keys("Logger")
  sleep 0.5
  find(:css,".w-select__filter").send_keys :enter
end

def printing_response_and_uri b, result
  puts b
  puts "Response code: #{result}"
end

################################################################
########## -------------- API Response -------------- ##########
################################################################

  def connection_select
    find(:css,".w-select__value_placeholder").click
    find(:xpath,"//w-select-option[contains(@class,'select-dropdown__item')]").click
  end

  def get(uri, params = {}, headers = {})
    response = execute(:get, URL.parse(uri, params).to_s, {}, headers)
    begin
      JSON.parse response
    rescue(JSON::ParserError) => ex
      response
    end
  end

  def post(uri, params = {}, header = {})
    response = JSON.parse execute(:post, uri, params, headers)
    begin
      JSON.parse response
    rescue(JSON::ParserError) => ex
      response
    end
  end

  def execute(method, uri, params = {}, headers = {})
    headers["content_type"]="application/json"
    req_param = {
      method: method,
      url: uri,
      params: params,
      headers: headers
    }
    req_param[:payload] = req_param.delete(:params).to_json if %w[post put patch].include?(method.to_s.downcase)
    res = RestClient::Request.execute(req_param)
    res.code
  end

  def folder_expand
    sleep 1
    find(:xpath,"//w-svg-icon[contains(@class,'folders__folder-expand')]").click
  end

  def activate_code_mirror(name, wrapper: nil)
    # unfocus from previous target
    unfocus
    field = find("#{wrapper} [data-field-id^='#{name}-']")
    field.click
  end

  def set_input_field(name, value, wrapper: nil, skip_validation: false)
    activate_code_mirror name, wrapper: wrapper
    exec_js %Q{ try {$("#{wrapper} [data-field-id^='#{name}-'] .CodeMirror")[0].CodeMirror.setValue(#{value.to_json});} catch(_err){} }

    focus_on_input name, wrapper: wrapper

    unless value.match?(/\_\(.*\)/) || skip_validation
      within "#{wrapper} [data-field-id^='#{name}-']" do
        expect(page).to have_content value
      end
    end
  end

  def select_adapter(name, line_type = nil, strict: false)
    adapter_select = find_adapter_list(line_type)
    adapter_select.find(:css,".w-select:not(.w-select_disabled) .w-select__arrow").click unless has_css?(".select-dropdown")
    find(:css,".w-select__filter").set(name)

    if strict
      find(:css,".select-dropdown__item-label", text: /^#{Regexp.escape(name)}$/).click
    else
      find(:css,".w-select__filter").send_keys :enter
    end
  end

  # NODOC
  def find_adapter_list(line_type = nil)
    find(:css,"#{find_step_container(line_type)} .adapter-select")
  end

  def find_step_container(line_type)
    if line_type
      (line_type == :trigger) ? "#trigger-step" : "#action-steps"
    else
      ""
    end
  end

  def set_select_picklist(name, value, context = "body", newline_select: false, dialog: false)
    open_picklist(name, context, dialog: dialog)
    if has_css?('.w-select__filter', wait: false)
      value = "#{value}\n" if newline_select
      find(:css,'.w-select__filter').set(value)
      find(:css,".w-select__filter").send_keys :enter unless newline_select
    else
      find(:xpath, '//body').find(:css,'.select-dropdown__item', text: value).click
    end
  end

  def open_picklist(name, context="body", dialog: false)
    unfocus
    open_select("#{context} [data-field-id^='#{name}-']", dialog: dialog)
  end

  def open_select(select_container, dialog: false)
    find(:css,"#{select_container} .w-select:not(.w-select_disabled) .w-select__arrow").click
    # expect(find(:xpath, '//body')).to have_selector(".w-select__dropdown")
    ensure_visible if dialog
  end

  def ensure_visible(selector='.select-dropdown')
    exec_js %Q{
      var scrollContainer = document.querySelector('.fullscreen-dialog') || document.querySelector('.w-dialog') || document.documentElement;
      var offset = document.querySelector('#{selector}').getBoundingClientRect().bottom - window.innerHeight;
      if (offset > 0) {
        scrollContainer.scrollTop += offset;
      }
    }
  end

  def unfocus
    # Creating temporary fixed element
    exec_js %Q{
      var tmp = document.createElement('div');
      tmp.innerHTML = '<div id="wUnfocus" style="position: fixed; width: 2px; height: 2px; z-index: 9999999; bottom: 0; left: 0"></div>';
      document.body.appendChild(tmp.firstChild);
    }

    # Clicking it to unfocus
    # XPath allows to ignore `within` wrappers and search from document root
    find(:xpath, "//div[@id='wUnfocus']").click

    # Removing temporary input
    exec_js "document.body.removeChild(document.getElementById('wUnfocus'))"
  end

  def exec_js(script)
    page.execute_script "return (function(){ #{script} })()"
  end
################## FeaturesHelper ##################
