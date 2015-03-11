Pixr.Collections.Albums = Backbone.Collection.extend({

  model: Pixr.Models.Album,

  url: 'api/albums',

  getOrFetch: function (id) {
    var album = this.get(id);

    if (album){
      album.fetch();
    } else {
      album = new Pixr.Models.Album({id: id});
      var albums = this;

      album.fetch({
        success: function() {
          albums.add(album);
        }
      });
    }

    return album;
  }

})

Pixr.Collections.albums = new Pixr.Collections.Albums();
