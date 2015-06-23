var outliner = outliner || {}

outliner.Outline = Backbone.Collection.extend({
	model: outliner.Item,
	url: '/items'
});