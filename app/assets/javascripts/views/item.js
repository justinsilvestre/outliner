var outliner = outliner || {}

outliner.ItemView = Backbone.View.extend({
	tagName: 'li',
	className: 'item-container',
	template: _.template($('#item-template').html()),

	render: function() {
		this.$el.html( this.template( this.model.attributes ) );
		return this;
	}

});