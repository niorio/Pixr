Pixr.Views.PhotosIndex = Backbone.CompositeView.extend({

  template: JST['photos/index'],

  tagName: 'ul',

  className: 'photos',

  initialize: function (options) {
    this.listenTo(this.collection, 'sync add', this.render);
  },

  render: function () {
    var that = this;
    var photoItemView;
    this.$el.empty();

    this.collection.each(function(photo) {
      photoItemView = new Pixr.Views.PhotoIndexItem({ model: photo });
      that.addSubview(that.el, photoItemView)
      photoItemView.render();
    })

    this.$el.justifiedGallery({
      rowHeight: 200,
      lastRow: 'nojustify',
      margins: 3
    });

    return this;
  },

  // appendPhoto: function (photo) {
  //   var photoItemView = new Pixr.Views.PhotoIndexItem({ model: photo });
  //   this.$el.append(photoItemView.render().$el);
  //   this.subviews.push(photoItemView);
  // },
  //
  // remove: function () {
  //   _.each(this.subviews, function(subview){
  //     subview.remove();
  //   });
  //   this.subviews = [];
  //   Backbone.View.prototype.remove.call(this);
  // }

});
