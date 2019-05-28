# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'posts show the date and the hour they were created' do
    signup_login
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world! Created on')
  end
end
