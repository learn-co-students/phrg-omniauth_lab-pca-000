require 'rails_helper.rb'

describe "welcome/home.html.erb", type: :view do
  it "displays all the widgets" do
    render
    expect(rendered).to have_link('Login with Facebook', :href => '/auth/facebook')
  end
end
