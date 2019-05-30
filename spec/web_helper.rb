# frozen_string_literal: true

def create_new_user
  visit '/users/sign_up'
  fill_in 'user[email]', with: 'example@example.com'
  fill_in 'user[password]', with: 'examplepassword'
  fill_in 'user[password_confirmation]', with: 'examplepassword'
  click_link_or_button ("Sign up")
end
