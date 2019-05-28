def signup_login
  visit '/signup'
  fill_in 'name', with: 'hello'
  fill_in 'email', with: 'hello@hello.com'
  fill_in 'password', with: '1234'
  click_button 'Submit'
  fill_in 'email', with: 'hello@hello.com'
  fill_in 'password', with: '1234'
  click_button 'Login'
  click_link "Go to your timeline"
end
