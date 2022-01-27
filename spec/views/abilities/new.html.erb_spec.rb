require 'rails_helper'

RSpec.describe "abilities/new", type: :view do
  before(:each) do
    assign(:ability, Ability.new(
      :name => "MyString",
      :effect => "MyString",
      :short_effect => "MyString",
      :generation => "MyString"
    ))
  end

  it "renders new ability form" do
    render

    assert_select "form[action=?][method=?]", abilities_path, "post" do

      assert_select "input[name=?]", "ability[name]"

      assert_select "input[name=?]", "ability[effect]"

      assert_select "input[name=?]", "ability[short_effect]"

      assert_select "input[name=?]", "ability[generation]"
    end
  end
end
