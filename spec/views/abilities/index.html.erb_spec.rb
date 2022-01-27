require 'rails_helper'

RSpec.describe "abilities/index", type: :view do
  before(:each) do
    assign(:abilities, [
      Ability.create!(
        :name => "Name",
        :effect => "Effect",
        :short_effect => "Short Effect",
        :generation => "Generation"
      ),
      Ability.create!(
        :name => "Name",
        :effect => "Effect",
        :short_effect => "Short Effect",
        :generation => "Generation"
      )
    ])
  end

  it "renders a list of abilities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Effect".to_s, :count => 2
    assert_select "tr>td", :text => "Generation".to_s, :count => 2
  end
end
