Pixr.Views.AlbumShow = Backbone.View.extend({

  initialize: function () {
    this.listenTo(this.model, 'add', this.render)
  },

  className: 'album-show',

  render: function () {
    this.$el.empty();
    var title = this.model.escape('title');
    this.$el.append($('<h1 class="album-title">').text(title));
    var grid = new Pixr.Views.PhotosIndex({ collection: this.model.photos() });
    this.$el.append(grid.render().$el);
    return this;
  }


});
