require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  scenario 'user can like a post' do
    sign_up
    create_new_post
    click_button('Like')
    expect(page).to have_content('likes: 1')
  end

  scenario 'user can only like a post once' do
    sign_up
    create_new_post
    click_button('Like')
    expect(page).not_to have_button('Like')
    expect(page).to have_content('likes: 1')
  end

  scenario 'user cannot like the post unless signed in' do
    sign_up
    create_new_post
    click_link('Log Out')
    visit '/posts'
    expect(page).not_to have_button('Like')
  end

  scenario 'user can like two different posts (but only once each)' do
    sign_up
    2.times { create_new_post }
    first(:button, 'Like').click
    click_button('Like')
    expect(page).not_to have_content('likes: 0')
  end
end
