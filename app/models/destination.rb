class Destination < ApplicationRecord
	belongs_to :member

	def full_address
	    "#{post_address} #{address} #{full_name}"
	  end
end
