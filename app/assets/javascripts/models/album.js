Pixr.Models.Album = Backbone.Model.extend({
  urlRoot: '/api/albums',

  photos: function () {
    if (!this._photos){
      this._photos = new Pixr.Collections.Photos({}, {album_id: this.id});
    }
    return this._photos
  },

  parse: function(response) {
    if (response.photos){
      this.photos().set(response.photos);
      delete response.photos;
    }
    return response;
  }

});
