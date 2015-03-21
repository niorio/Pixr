Pixr.Views.AlbumsIndex = Backbone.View.extend({

  template: JST['albums/index'],

  initialize: function () {
    this.listenTo(this.collection, 'add', this.render)
  },

  render: function () {
    var content = this.template({ albums: this.collection });
    this.$el.html(content);

    this.$('.album-list').justifiedGallery({
      rowHeight: 250,
      lastRow: 'nojustify',
      margins: 25,
      imagesAnimationDuration: 0
    });


    return this;
  }

});
