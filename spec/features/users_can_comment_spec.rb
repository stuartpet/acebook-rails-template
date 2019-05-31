require 'rails_helper'
require 'web_helper'

feature 'Users can comment on a post' do
  scenario 'user has the option to comment on a post' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    expect(page).to have_button("Add")
  end

  scenario 'user comment successfully appears on page' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    fill_in 'comment_content', with: "example comment"
    click_button "Add"
    expect(page).to have_content("example comment")
  end

  scenario 'user can only delete their comments' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button 'Add'
    fill_in 'comment_content', with: "example comment"
    click_button "Add"
    expect(page).to have_button("Delete Comment")
  end

  scenario 'comments are successfully deleted' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello!'
    click_button 'Submit'
    click_button 'Add'
    fill_in 'comment_content', with: "new comment"
    click_button "Add"
    click_button("Delete Comment", match: :first)
    expect(page).not_to have_content("example comment")
  end

  scenario 'users can only edit their comments' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button 'Add'
    fill_in 'comment_content', with: "newer comment"
    click_button "Add"
    expect(page).to have_button("Edit Comment")
  end

  scenario 'edited comments display correctly' do
    create_new_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button 'Add'
    fill_in 'comment_content', with: "newer comment"
    click_button "Add"
    click_button("Edit Comment", match: :first)
    fill_in 'comment_content', with: "edited"
    click_button "Update"
    expect(page).to have_content("edited")
  end
end 
