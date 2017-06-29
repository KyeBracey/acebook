require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'Can create a new post' do
    user = User.create(username: 'Jade', password: '123456', email: 'jade@jade.com')
    post = user.posts.create(message: "Hello test!")
    expect(post).to be_valid
  end

  it 'Cannot create a post anonymously (without being attached to a user)' do
    post = Post.create(message: "Hello test!")
    expect(post).not_to be_valid
  end
end
