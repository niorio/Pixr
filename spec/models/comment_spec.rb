require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before(:each) do
    @user = User.create(username: "test", email:'example@example.com', password: 'password')
    @photo = Photo.create(title: "photo1", owner: @user)
  end

  it 'has an author' do
    comment = Comment.new(body: "test", photo: @photo)
    expect(comment.valid?).to be false

    comment2 = Comment.new(body: "test", photo: @photo, author: @user)
    expect(comment2.valid?).to be true
    expect(comment2.author.username).to eq("test")
  end

  it 'must have a body' do
    comment = Comment.new(photo: @photo, author: @user)
    expect(comment.valid?).to be false
  end

  it 'belongs to a photo' do
    comment = Comment.new(body: "test", author: @user)
    expect(comment.valid?).to be false

    comment2 = Comment.new(body: "test", photo: @photo, author: @user)
    expect(comment2.photo.title).to eq("photo1")
  end


end
