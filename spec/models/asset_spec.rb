require 'rails_helper'

describe Asset do 
	describe 'title' do
		it 'should not create if missing attribute' do
			asset = Asset.new(title: "Derek")

			expect(asset).to_not be_valid
		end
	end
end