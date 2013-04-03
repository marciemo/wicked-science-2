require 'spec_helper'

describe Comment do
  context 'validations' do
    it {should validate_presence_of :text}
    it {should validate_presence_of :article_id}
  end
  context 'accessors' do
    it {should allow_mass_assignment_of :text}
    it {should allow_mass_assignment_of :article_id}
  end

  context 'associations' do
    it {should belong_to(:article)}
  end
end