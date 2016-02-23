class Customer < ActiveRecord::Base
	has_many :items
	has_many :sales
end
