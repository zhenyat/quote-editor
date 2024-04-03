require 'rails_helper'

RSpec.describe "quotes/show", type: :view do
  before(:each) do
    assign(:quote, Quote.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
