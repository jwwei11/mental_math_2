require 'rails_helper'

RSpec.describe Score, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:setting) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
