require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) {FactoryGirl.create :author}

  it {expect(author).to validate_presence_of(:first_name)}
  it {expect(author).to validate_presence_of(:last_name)}

  it {expect(author).to have_many(:book)}
end
