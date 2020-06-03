require 'rails_helper'

RSpec.feature "Visitors can navigate to the product detail page", type: :feature, js: true  do
  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They can go from the home page to the product detail page' do
    #ACT 
    visit root_path
    first(:link, "Details").click
     # DEBUG
     save_screenshot

     # VERIFY
     expect(page).to have_content ("Description")
  end 
end
