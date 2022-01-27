require 'rails_helper'

RSpec.describe "abilities/show", type: :view do
  before(:each) do
    @ability = assign(:ability, Ability.create!(
      :name => "Name",
      :effect => "Effect",
      :short_effect => "Short Effect",
      :generation => "Generation"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Effect/)
    expect(rendered).to match(/Short Effect/)
    expect(rendered).to match(/Generation/)
  end
end
