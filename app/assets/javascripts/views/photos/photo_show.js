Pixr.Views.PhotoShow = Backbone.CompositeView.extend({

  template: JST['photos/show'],

  className: 'photo-show',

  events: {
    'submit .comment-form': "submitComment",
    'click .delete-photo': 'confirmDelete',
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

    var likeview = new Pixr.Views.Like({ model: this.model });
    this.addSubview('.user-info', likeview);

    var userview = new Pixr.Views.UserCard({ model: this.model.owner() });
    this.addSubview('.user-info', userview)

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

  confirmDelete: function(event){
    event.preventDefault();
    var modal = new Backbone.ModalView({
      callback: this.destroyPhoto.bind(this),
      message: "Are you sure you want to delete this photo?"
    });

    this.addSubview('.extras', modal);

  },

  destroyPhoto: function() {
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
