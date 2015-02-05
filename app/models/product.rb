class Product < ActiveRecord::Base
	has_many :reviews

	validates :name  , presence: true
	validates :price , presence: true

##########################################
#
# 	C L A S S
#
##########################################

	def self.get_all(limit)
		order('created_at DESC').limit(limit)
	end

	def self.get_one(id)0
		find_by(id: id)
	end

	def self.search(query)
		result = where("name LIKE '%#{query}%' OR description LIKE '%#{query}%'")
		get_by_rating(result)
	end

	def self.get_by_rating(entries)
		entries.sort {|x,y| y.avg_rating <=> x.avg_rating}
	end

##########################################
#
#  	I N S T A N C E
#
##########################################

	def avg_rating
		count = reviews.count
		count > 0 ? '%.2f' % (reviews.reduce(0) {|sum,x| sum + x.rating }.to_f / count) : '0.00'
	end

end


