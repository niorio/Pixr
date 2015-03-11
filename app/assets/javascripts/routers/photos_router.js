Pixr.Routers.Photos = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl
    this.collection = new Pixr.Collections.Photos();
  },

  routes: {
    '': 'index',
    'photos/:id': 'show'
  },

  index: function () {
    this.collection.fetch();
    var indexView = new Pixr.Views.PhotosIndex({ collection: this.collection });
    this._swapView(indexView);
  },

  show: function (id) {
    var photo = this.collection.getOrFetch(id);
    var showView = new Pixr.Views.PhotoShow({ model: photo });
    this._swapView(showView)
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }

});
