Pixr.Views.Like = Backbone.View.extend({

  events: {
    'click': 'toggleLike'
  },

  render: function () {
    var content
    if (this.model.get('liked')){
      content = "UNLIKE " + this.model.get('like_count');
    } else {
      content = "LIKE " + this.model.get('like_count');
    }
    this.$el.html(content);
    return this;
  },

  toggleLike: function () {

    var photo = this.model;
    var view = this;

    $.ajax({
      url:'api/likes',
      method: 'post',
      datatype: "json",
      data: {photo_id: photo.id},
      success: function () {
        photo.set({liked: !photo.get('liked')});
        if (photo.get('liked')){
          photo.set('like_count', photo.get('like_count') + 1)
        } else {
          photo.set('like_count', photo.get('like_count') - 1)
        }
        view.render();
      }
    })
  }


})
