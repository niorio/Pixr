require 'rails_helper'

RSpec.describe Photo, :type => :model do
  before(:each) do
    @user = User.create(email:'example@example.com', password: 'password')
  end

  it 'has a title' do
    photo = Photo.new(owner_id: @user.id)
    expect(photo.valid?).to be false
  end

  it 'belongs to a user' do
    photo = @user.photos.create(title: 'flowers')
    expect(@user.photos.first).to eq(photo)
    expect(photo.owner).to_not be_nil
    expect(photo.owner.email).to eq('example@example.com')
  end


end
