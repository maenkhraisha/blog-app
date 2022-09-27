require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "load and show a list of users" do
    user_params = { name: "maen", photo: "https://randomuser.me/api/portraits/men/79.jpg", bio: "software developer" }
    user = User.create(user_params)

    visit users_path(user)
    expect(page).to have_content("maen") 
  end
end
