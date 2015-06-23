class Placing < ActiveRecord::Base
	after_save :place_at_end, if: Proc.new { |placing| placing.place.nil? }

  belongs_to :parent, class_name: 'Item'
  belongs_to :item

  default_scope { order('place ASC') }
  scope :top_level, -> { where(parent_id: nil) }

  def siblings
  	Placing.where(parent_id: parent_id)
  end

  def change_place(new_place)
  	diff = (new_place - place).abs 
  	if diff == 1
  		switch_places(new_place)
  	elsif diff > 1
  		insert_item_at(new_place)
		end
		place
  end

  def change_parent(new_parent)
  	return nil if parent == new_parent
  	new_parent_id = new_parent.nil? ? nil : new_parent.id
  	new_place = new_parent.nil? ? Placing.top_level.length + 1 : new_parent.children.length + 1
  	update(parent_id: new_parent_id, place: new_place)
  end

  private

	  def switch_places(new_place)
	  	old_place = place
	  	siblings.find_by(place: new_place).update(place: old_place)
	  	update(place: new_place)
	  end

	  def insert_item_at(new_place)
		  shift = new_place - place < 0 ? 1 : -1
		  shift_places_until(new_place, shift) 
			update(place: new_place)
	  end

	  def shift_places_until(other_place, place_shift)
	  	siblings.each do |sibling|
	  		places = [other_place, place]
	  		if sibling != self && sibling.place.between?(places.min, places.max)
	  			sibling.update(place: sibling.place + place_shift)
	  			# does not update sibling items' place attribute
	  		end
	  	end
	  end

	  def place_at_end
				new_place = item.siblings.length
				update_attributes(place: new_place)
	  end

end
