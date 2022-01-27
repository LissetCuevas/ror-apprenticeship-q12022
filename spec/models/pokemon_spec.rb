require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before :each do
    @pokemon = create(:pokemon)
  end

  it 'Should pass if pokemon has valid inputs' do
    expect(@pokemon).to be_valid
  end
  
  it 'Should pass if user is assigned' do
    @user = create(:user)
    @pokemon.user_id = @user.id
    expect(@pokemon).to be_valid
  end

  it 'Should fail if name is not present' do
    @pokemon.name = nil
    expect(@pokemon).to_not be_valid
  end

  it 'Should fail if name is not unique' do
    new_pokemon = create(:pokemon)
    new_pokemon.name = @pokemon.name
    expect(new_pokemon).to_not be_valid
  end

  it 'Should fail if height is not number' do
    @pokemon.height = 'hola'
    expect(@pokemon).to_not be_valid
  end
end
