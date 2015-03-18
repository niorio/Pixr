Pixr.Views.PhotosIndex = Backbone.View.extend({

  template: JST['photos/index'],

  tagName: 'ul',

  className: 'photos',

  initialize: function () {
    this.listenTo(this.collection, 'sync add', this.render);

    this.subviews = [];
  },

  render: function () {
    console.log("render")
    var that = this;
    this.$el.empty();
    this.collection.each(function(photo) {
      that.appendPhoto(photo);
    })

    this.$el.justifiedGallery({
      rowHeight: 200,
      lastRow: 'nojustify',
      margins: 3
    });

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
