Given(/^I am on "([^"]*)"$/) do |arg1|
  visit arg1
end

When(/^I inject ckeditor check$/) do
  page.execute_script("function isCkeditorLoaded(instance_selector){var status;if(window.CKEDITOR&&CKEDITOR.instances&&CKEDITOR.instances[instance_selector]){status=CKEDITOR.instances[instance_selector].status}return status==='ready'};")
end

When /^I fill in "([^"]*)" in the editor "([^"]*)"$/ do |value, input_id|
  page.execute_script("CKEDITOR.instances['#{input_id}'].setData('#{value}');")
end

When(/^I go to "([^"]*)"$/) do |arg1|
  visit arg1
end

When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

When(/^I scroll to bottom$/) do
  page.execute_script "window.scrollBy(0,10000)"
end

When(/^I select media info$/) do
  page.execute_script("jQuery('.cke_dialog_background_cover').remove()")
  page.execute_script("jQuery('.cke_dialog_contents_body > div').hide()")
  page.execute_script("jQuery('.cke_dialog_contents_body > div:first').show()")
end

When(/^I reload page$/) do
  page.execute_script("window.location.reload();")
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^I check "([^"]*)"$/) do |arg1|
  check(arg1)
end

When(/^I press "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

When(/^I follow "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

When(/^I click "([^"]*)"$/) do |arg1|
  find(arg1, :match => :first).trigger('click')
end

When(/^I choose "([^"]*)"$/) do |arg1|
  choose(arg1)
end

When(/^I press "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
    within(:css, arg2) do
     	click_button(arg1)
    end
end

When(/^I follow "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
    within(:css, arg2) do
      click_link(arg1)
    end
end

When(/^I click "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
    within(:css, arg2) do
      find(arg1, :match => :first).click
    end
end

When(/^I select the option containing "([^\"]*)" in the autocomplete field "([^"]*)"$/) do |arg1, arg2|
  page.all(:css, arg2) do
    find(arg1, :match => :first).click
  end
end

When /^I reload the page$/ do
  page.evaluate_script("window.location.reload()");
end

Then(/^I should be on "([^"]*)"$/) do |arg1|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  assert_equal true, current_path.include?(arg1)
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should not see "([^"]*)"$/) do |arg1|
  page.should have_no_content(arg1)
end

Then(/^I should see link "([^"]*)"$/) do |arg1|
  find_link(arg1).visible?
end

Then(/^I should see "([^"]*)" flash notice "([^"]*)"$/) do |arg1,arg2|
  page.should have_css(arg1, :visible => false) do
    page.should have_content(arg2)
  end
end

Then(/^I should see "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
    within(:css, arg2) do 
    page.should have_content "#{arg1}"
  end
end
