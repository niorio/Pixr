Pixr.Routers.router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    '': 'index',
    'photos/:id': 'show',
    'albums': 'albumIndex',
    'albums/:id': 'albumShow'
  },

  index: function () {
    var photos = Pixr.Collections.photos
    photos.fetch();
    var indexView = new Pixr.Views.PhotosIndex({ collection: photos });
    this._swapView(indexView);
  },

  show: function (id) {
    var photo = Pixr.Collections.photos.getOrFetch(id);
    var showView = new Pixr.Views.PhotoShow({ model: photo });
    this._swapView(showView)
  },

  albumIndex: function () {
    var albums = Pixr.Collections.albums;
    albums.fetch();
    var albumIndexView = new Pixr.Views.AlbumsIndex({ collection: albums });
    this._swapView(albumIndexView);
  },

  albumShow: function (id) {
    var album = Pixr.Collections.albums.getOrFetch(id);
    album.fetch();
    var albumShowView = new Pixr.Views.AlbumShow({ model: album });
    this._swapView(albumShowView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
