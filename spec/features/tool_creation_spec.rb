require 'rails_helper'

RSpec.feature "Tool management", type: :feature do

  scenario "user creates a new tool" do
    #visit a page with the form to create a new tool
    visit new_tool_path
    # fill in the tools attributes: name, price, quantity
    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: 10.99
    fill_in "tool[quantity]", with: 10
    # submit that form
    find(:button, "Create Tool").click
    # check to see that I am on the tool show page
    expect(current_path).to_eq( tool_path(Tool.last.id) )
    # check and make sure all the attributes I filled in and submitted are displaying on the page 

    with(."tool_info") do
      expect(page)
    end

  end

end
