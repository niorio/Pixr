Pixr.Views.PhotoForm = Backbone.View.extend({

  template: JST['photos/form'],

  events: {
    
  },
	
	render: function () {
		var content = this.template({ photo: this.model });
		this.$el.html(content);
		return this;
	}
	
});
