Pixr.Views.PhotoForm = Backbone.View.extend({

  template: JST['photos/form'],

  tagName: 'form',

  className: 'photo-form',

  events: {
    'submit': 'submitPhoto',
    "change #input-img-file": "changeImg"
  },

	render: function () {
		var content = this.template({ photo: this.model });
		this.$el.html(content);
		return this;
	},

  submitPhoto: function(event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();

    var that = this;
    this.model.save(attrs, {
      success: function (model) {
        that.collection.add(model);
        Backbone.history.navigate("photos/" + model.id, { trigger: true });
      }
    });
  },

  changeImg: function (event) {
    var file = event.currentTarget.files[0];
    var fileReader = new FileReader();
    var that = this;

    fileReader.onloadend = function() {
      that.model.set("img", fileReader.result);
      that.previewImg(fileReader.result);
    }

    fileReader.readAsDataURL(file);
  },

  previewImg: function (src) {
    this.$('#preview').attr('src', src);
  }


});
