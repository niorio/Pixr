Pixr.Views.PhotosIndex = Backbone.CompositeView.extend({


  initialize: function (options) {
    this.listenTo(this.collection, 'sync add', this.render);
  },

  render: function () {
    var that = this;
    var photoItemView;
    this.$el.empty();
    this.$el.append($('<ul class="photos">'))


    this.collection.each(function(photo) {
      photoItemView = new Pixr.Views.PhotoIndexItem({ model: photo });
      that.addSubview('.photos', photoItemView)
    })

    this.$('.photos').justifiedGallery({
      rowHeight: 200,
      lastRow: 'nojustify',
      margins: 3
    });

    return this;
  },

});
