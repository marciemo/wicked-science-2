require 'spec_helper'

describe Article do  
  context 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :author}
    it {should validate_presence_of :link}
  end

  context 'readers' do
    it {should allow_mass_assignment_of :title}
    it {should allow_mass_assignment_of :author}
    it {should allow_mass_assignment_of :link}
  end

  context 'associations' do
    it {should have_many :comments}
  end
end