require 'rails_helper'

RSpec.describe Like, :type => :model do
  before(:each) do
    @user = User.create(username: "test", email:'example@example.com',
      password: 'password')
    @photo = Photo.create(title: "photo1", owner: @user,
      img: File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'))
  end

  it 'has a user' do
    like1 = Like.new(photo: @photo)
    expect(like1.valid?).to be false

    like2 = Like.new(user: @user, photo: @photo)
    like3 = @user.likes.new(photo: @photo)
    expect(like2.user).to be(@user)
    expect(like3.user).to be(@user)
  end
  it 'has a photo' do
    like1 = Like.new(user: @user)
    expect(like1.valid?).to be false
    like2 = Like.new(user: @user, photo: @photo)
    expect(like2.photo).to be(@photo)
  end
  it 'does not allow the user to like the same thing twice' do
    like1 = Like.create(user: @user, photo: @photo)
    like2 = Like.create(user: @user, photo: @photo)
    expect(like1.valid?).to be true
    expect(like2.valid?).to be false
  end
  it 'has helper methods to determine if the user has liked a photo' do
    like = Like.create(user: @user, photo: @photo)
    expect(@photo.liked_by?(@user)).to be true
    expect(@user.likes?(@photo)).to be true
  end
end
