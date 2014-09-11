require 'rails_helper'

describe Comment do 
	describe 'title' do
		it 'should not create if missing attribute' do
			comment = Comment.new(body: "test")

			expect(comment).to_not be_valid
		end
	end
end