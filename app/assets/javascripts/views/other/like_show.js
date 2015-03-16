Pixr.Views.Like = Backbone.View.extend({

  events: {
    'click': 'toggleLike'
  },

  render: function () {
    var content
    if (this.model.get('liked')){
      content = "UNLIKE"
    } else {
      content = "LIKE"
    }
    this.$el.html(content);
    return this;
  },

  toggleLike: function () {

    var photo = this.model;
    var that = this;

    $.ajax({
      url:'api/likes',
      method: 'post',
      datatype: "json",
      data: {photo_id: photo.id},
      success: function () {
        photo.set({liked: !photo.get('liked')});
        that.render();
      }
    })
  }


})
