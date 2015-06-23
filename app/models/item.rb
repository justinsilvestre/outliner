class Item < ActiveRecord::Base
	after_save :ensure_placing_exists

	has_one :placing, dependent: :destroy
	has_one :parent, through: :placing

	has_many :parentings, class_name: 'Placing', foreign_key: :parent_id, dependent: :destroy
	has_many :children, through: :parentings, source: :item, dependent: :destroy


	def siblings
		# remember, this includes self
		placing.siblings.map(&:item)
	end

	def has_siblings?
		placing.siblings.length > 1
	end

	def ensure_placing_exists
		# for top-level items (not built from parent items)
		create_placing if placing.nil?
	end

	def place
		@place ||= placing.nil? ? nil : placing.place
	end

	def place=(new_place)
		space_between = new_place - place
  	return false if space_between == 0
  		
		siblings_length = siblings.length
	  new_place = siblings_length if new_place > siblings_length
		@place = placing.change_place(new_place)
	end

	def move(new_parent, new_place=nil)
		self.place = siblings.length
		placing.change_parent(new_parent) unless parent == new_parent
		self.place = new_place unless new_place.nil?
	end

end
