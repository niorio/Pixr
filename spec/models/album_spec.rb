require 'rails_helper'

RSpec.describe Album, :type => :model do
  before(:each) do
    @user = User.create(email: "example@example.com", password: "password")
  end

  it 'has a title' do
    album = @user.albums.new
    expect(album.valid?).to be false

  end

  it 'belongs to a user' do
    album = @user.albums.new(title: 'photos')
    expect(album.owner).to eq(@user)
  end

  it 'has many photos' do
    album = @user.albums.create(title:'party')
    photo = @user.photos.create(title:"party pic 1", album: album)
    expect(album.photos.first).to eq(photo)
    expect(photo.album).to eq(album)
  end

end
