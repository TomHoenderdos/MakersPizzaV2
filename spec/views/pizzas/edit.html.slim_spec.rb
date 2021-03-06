require 'rails_helper'

RSpec.describe "pizzas/edit", type: :view do
  before(:each) do
    @pizza = assign(:pizza, Pizza.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit pizza form" do
    render

    assert_select "form[action=?][method=?]", pizza_path(@pizza), "post" do

      assert_select "input#pizza_name[name=?]", "pizza[name]"
    end
  end
end
