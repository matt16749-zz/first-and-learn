require 'rails_helper'

# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# before :each do
#    User.destroy_all
# end

describe User do
	describe '#presence' do
		it 'should not create if missing an attribute' do
			User.destroy_all
			user = User.new(email: "test@test.com")
			expect(user).to_not be_valid
		end
	end
end

describe User do
	describe '#uniqueness' do
		it 'should not create if email is not unique' do
			User.destroy_all
			user = User.create(email: "test@test.com")
			expect{ User.create(email: "test@test.com")}.to_not change{User.count}
		end
	end
end
