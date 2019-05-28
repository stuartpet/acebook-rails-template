# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    signup_login
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end
