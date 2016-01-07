require 'rails_helper'

RSpec.describe "pizzas/index", type: :view do
  before(:each) do
    assign(:pizzas, [
      Pizza.create!(
        :name => "Name"
      ),
      Pizza.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of pizzas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
