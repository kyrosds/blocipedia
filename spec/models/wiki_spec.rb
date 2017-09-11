require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let (:user) { User.create!(email: 'd.sires@yahoo.com', password: 'helloworld') }
  let (:my_wiki) { Wiki.create!(title: 'New Wiki Title', body: 'New Wiki Body', private: false)}

  describe "attributes" do
    it "has title, body, and private attributes" do
      expect(my_wiki).to have_attributes(title: 'New Wiki Title', body: 'New Wiki Body', private: false )
    end
  end
end
