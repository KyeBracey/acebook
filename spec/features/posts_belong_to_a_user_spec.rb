require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Show the username of their poster in the view' do
    sign_up
    create_new_post
    expect(page).to have_content('Posted by Jade')
  end
end
