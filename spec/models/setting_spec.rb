require 'rails_helper'

RSpec.describe Setting, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
