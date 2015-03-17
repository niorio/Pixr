Pixr.Views.PhotoForm = Backbone.View.extend({

  template: JST['photos/form'],

  tagName: 'form',

  className: 'photo-form',

  initialize: function () {
    Pixr.Collections.albums.fetch();
    this.listenTo(Pixr.Collections.albums, 'sync', this.render)
  },

  events: {
    'submit': 'submitPhoto',
    "change #input-img-file": "changeImg",
    'change select': "newAlbum"
  },

	render: function () {
		var content = this.template({ photo: this.model,
                  albums: Pixr.Collections.albums,
                  errors: this.errors});
		this.$el.html(content);
		return this;
	},

  submitPhoto: function(event) {
    event.preventDefault();

    this.$('.upload-spinner').removeClass('hidden');
    this.$('button').prop("disabled", true);

    var attrs = this.$el.serializeJSON();

    var that = this;
    this.model.save(attrs, {
      success: function (model) {
        this.$('.upload-spinner').addClass('hidden');
        this.$('button').prop("disabled", false);
        that.collection.add(model);
        Backbone.history.navigate("photos/" + model.id, { trigger: true });
      },
      error: function (model, response){
        this.$('.upload-spinner').addClass('hidden');
        this.$('button').prop("disabled", false);
        that.errors = JSON.parse(response.responseText);
        that.render();
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
    this.$('#preview').removeClass('hidden').attr('src', src);
  },

  newAlbum: function(event) {
    $albumSelect = $(event.currentTarget)

    if ($albumSelect.val() !== "new-album"){
      return;
    }
    $albumInput = $('<input type="text" name="new_album_name">');
    $albumSelect.replaceWith($albumInput);

  }


});
