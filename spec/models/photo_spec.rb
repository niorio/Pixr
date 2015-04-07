require 'rails_helper'

RSpec.describe Photo, :type => :model do
  before(:each) do
    @user = User.create(username: "test", email:'example@example.com', password: 'password')
  end

  it 'has a title' do
    photo = Photo.new(owner_id: @user.id)
    expect(photo.valid?).to be false
  end

  it 'belongs to a user' do
    photo = @user.photos.create(title: 'flowers')
    expect(@user.photos.first).to eq(photo)
    expect(photo.owner).to_not be_nil
    expect(photo.owner.username).to eq('test')
  end

  it 'has an attached image' do
    photo = @user.photos.create(title: "test")
    expect(photo.valid?).to be false
    photo2 = @user.photos.create(title: "test2",
      img: File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'))
    expect(photo2.valid?).to be true
  end

end
