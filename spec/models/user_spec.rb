require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
    
  end

  it 'Should pass if user has valid inputs' do 
    expect(@user).to be_valid
  end

  it 'Should fail if email is not present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'Should fail if email is not unique' do
    new_user = create(:user)
    new_user.email = @user.email
    expect(new_user).to_not be_valid
  end

end
