require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'requires a password of at least 6 characters' do
    user = User.new(email:"john@example.com")
    expect(user.valid?).to be false

    user2 = User.new(email:"joe@example.com", username:"joe", password:"be")
    expect(user2.valid?).to be false

    user3 = User.create(email:"john@example.com", username:"joe", password: "password")
    expect(user3.valid?).to be true
  end

  it 'requires a unique username addresss' do
    user = User.new
    expect(user.valid?).to be false

    user2 = User.create(username: "bob", email:"bob@example.com", password: "password")
    user3 = User.create(username: "bob", email:"bob@gmail.com", password: "password")

    expect(user2.valid?).to be true
    expect(user3.valid?).to be false
  end

  it 'automatically generates a session token' do
    user = User.create(username: "john", email:"john@example.com", password: "password")
    expect(user.session_token).to_not be_nil
  end

  it 'does not store unencrypted password' do
    User.create(username: "joe", email:"john@example.com", password: "password")
    user = User.find_by(email:"john@example.com")
    expect(user.password).to be_nil
  end
end
