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
    this.subviews = [];
  },

  render: function () {
    var content = this.template({ photo: this.model });
    this.$el.html(content);

    var that = this;

    this.model.comments().each(function(comment){
      that.appendComment(comment);
    })

    return this;
  },

  appendComment: function (comment) {
    var commentView = new Pixr.Views.CommentShow({ model: comment });
    this.$('.comments').append(commentView.render().$el);
    this.subviews.push(commentView);
  },

  submitComment: function(event) {
    event.preventDefault();
    attrs = $(event.target).serializeJSON();
    var comment = new Pixr.Models.Comment();
    comment.set('time_ago', "just now")
    comment.set('photo_id', this.model.id)

    var that = this;
    comment.save(attrs, {
      success: function (model) {
        that.appendComment(model);
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
      wait: true,
      error: function () {
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

    this.model.save({description: newDescription});
  },

  remove: function() {
    _.each(this.subviews, function(subview){
      subview.remove();
    });
    Backbone.View.prototype.remove.call(this);
  }


});
