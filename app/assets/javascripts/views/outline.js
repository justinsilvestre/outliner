var outliner = outliner || {};

outliner.OutlineView = Backbone.View.extend({
	el: '#outline',

	initialize: function() {
		this.collection = new outliner.Outline();
		this.collection.fetch({reset: true});
		this.render();
		console.log('aaaa');
	},

	render: function() {
		this.collection.each(function( item ) {
			this.renderItem( item );
		}, this);
	},

	renderItem: function( item ) {
		var itemView = new outliner.ItemView({
			model: item
		});
		this.$el.append( itemView.render().el );
	}
});