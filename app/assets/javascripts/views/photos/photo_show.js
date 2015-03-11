Pixr.Views.PhotoShow = Backbone.View.extend({

  template: JST['photos/show'],

  events: {
    'submit .comment-form': "submitComment"
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var content = this.template({ photo: this.model });
    this.$el.html(content);
    return this;
  },

  submitComment: function(event) {
    event.preventDefault();
    attrs = $(event.target).serializeJSON();
    var comment = new Pixr.Models.Comment();

    var photo = this.model;

    comment.save(attrs, {
      success: function () {
        photo.fetch();
      }
    });
  }


});
