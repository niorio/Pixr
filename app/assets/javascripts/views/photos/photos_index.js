Pixr.Views.PhotosIndex = Backbone.View.extend({

  template: JST['photos/index'],

  tagName: 'ul',

  className: 'photos group',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'change', this.render);
    this.subviews = [];
  },

  render: function () {
    var that = this;
    this.$el.empty();
    this.collection.each(function(photo) {
      that.appendPhoto(photo);
    })

    return this;
  },

  appendPhoto: function (photo) {
    var photoItemView = new Pixr.Views.PhotoIndexItem({ model: photo });
    this.$el.append(photoItemView.render().$el);
    this.subviews.push(photoItemView);
  },

  remove: function () {
    _.each(this.subviews, function(subview){
      subview.remove();
    });
    this.subviews = [];
    Backbone.View.prototype.remove.call(this);
  }

});
