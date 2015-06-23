_.templateSettings = {
	interpolate : /\{\{([\s\S]+?)\}\}/g
};


var outliner = outliner || {}

outliner.Item = Backbone.Model.extend({
	defaults: {
		content: '',
		note: '',
		completed: false,
		expanded: true
	},
	idAttribute: 'id'
});