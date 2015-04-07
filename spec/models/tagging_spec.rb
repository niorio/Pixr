require 'rails_helper'

RSpec.describe Tagging, :type => :model do
  before(:each) do
    @user = User.create(username: "test", email:'example@example.com', password: 'password')
  end

  it 'connects a photo to a tag' do
    tag = Tag.create(name: "dogs")
    photo = Photo.create(owner: @user, title: "test",
      img: File.new(Rails.root + 'spec/fixtures/images/test_image.jpg'))
    tagging = Tagging.create(photo: photo, tag: tag)
    expect(tag.valid?).to be true
    expect(tag.photos.first).to eq(photo)
    expect(photo.tags.first).to eq(tag)
  end
end
