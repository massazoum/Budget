require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'user@example.com', password: 'password')
    item = Item.new(name: 'Desk computer', user:)
    expect(item).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(email: 'user@example.com', password: 'password')
    item = Item.new(name: nil, user:)
    expect(item).to_not be_valid
  end
end
