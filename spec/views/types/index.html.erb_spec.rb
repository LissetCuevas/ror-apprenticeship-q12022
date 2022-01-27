require 'rails_helper'

RSpec.describe "types/index", type: :view do
  before(:each) do
    assign(:types, [
      Type.create!(
        :name => "Name",
        :generation => "Generation"
      ),
      Type.create!(
        :name => "Name",
        :generation => "Generation"
      )
    ])
  end

  it "renders a list of types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Generation".to_s, :count => 2
  end
end
