Pixr.Views.PhotoShow = Backbone.View.extend({

  template: JST['photos/show'],

  events: {
    'submit .comment-form': "submitComment",
    'click .delete-photo': 'destroyPhoto',
    'click .edit-title': 'editTitle',
    'blur .title-form': 'updateTitle',
    'click .edit-description': 'editDescription',
    'blur .description-form': 'updateDescription'
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
  },

  destroyPhoto: function(event) {
    event.preventDefault();
    this.model.destroy({
      success: function () {
        Backbone.history.navigate("", {trigger: true});
      }
    });
  },

  editTitle: function (event) {
    event.preventDefault();
    $(event.currentTarget).remove();
    $titleForm = $('<input class="title-form">');
    $titleForm.val(this.model.escape('title'));
    this.$('.photo-title').html($titleForm);
    $titleForm.focus();
  },

  updateTitle: function(event){
    var newTitle = $(event.currentTarget).val();
    var that = this;

    this.model.save({title: newTitle}, {
      success: function () {
        that.render();
      }
    });
  },

  editDescription: function (event) {
    event.preventDefault();
    $(event.currentTarget).remove();
    $descriptionForm = $('<input class="description-form">');
    $descriptionForm.val(this.model.escape('description'));
    this.$('.photo-description').html($descriptionForm);
    $descriptionForm.focus();
  },

  updateDescription: function(event){
    var newDescription = $(event.currentTarget).val();
    var that = this;

    this.model.save({description: newDescription}, {
      success: function () {
        that.render();
      }
    });
  }


});
