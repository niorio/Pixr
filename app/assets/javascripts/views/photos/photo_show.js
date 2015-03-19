Pixr.Views.PhotoShow = Backbone.CompositeView.extend({

  template: JST['photos/show'],

  className: 'photo-show',

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

    likeview = new Pixr.Views.Like({ model: this.model });
    this.addSubview('.like', likeview);

    var that = this;
    var commentView;

    this.model.comments().each(function(comment){
      commentView = new Pixr.Views.CommentShow({ model: comment });
      that.addSubview('.comments', commentView);
    })

    this.model.tags().each(function(tag){
      tagView = new Pixr.Views.Tag({ model: tag });
      that.addSubview('.tags-list', tagView);
    })

    return this;
  },

  submitComment: function(event) {
    event.preventDefault();
    attrs = $(event.target).serializeJSON();
    var commentBox = this.$('textarea');

    var comment = new Pixr.Models.Comment();
    comment.set('photo_id', this.model.id)

    var that = this;
    comment.save(attrs, {
      success: function (model) {
        commentBox.val('');
        var commentView = new Pixr.Views.CommentShow({ model: comment });
        that.addSubview('.comments', commentView);
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

});
