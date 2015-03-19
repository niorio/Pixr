Pixr.Collections.Photos = Backbone.Collection.extend({

  model: Pixr.Models.Photo,

  url: 'api/photos',

  getOrFetch: function (id) {
    var photo = this.get(id);

    if (photo){
      photo.fetch();
    } else {
      photo = new Pixr.Models.Photo({id: id});
      var photos = this;

      photo.fetch({
        success: function() {
          photos.add(photo);
        }
      });
    }

    return photo;
  }

});

Pixr.Collections.LikedPhotos = Backbone.Collection.extend({
  url: 'api/photos/liked',
  model: Pixr.Models.Photo
});

Pixr.Collections.FollowedPhotos = Backbone.Collection.extend({
  url: 'api/photos/followed',
  model: Pixr.Models.Photo
});

Pixr.Collections.PhotosByTag= Backbone.Collection.extend({
  url: function () {
    return 'api/tags/'+ this.tag_id
  },
  model: Pixr.Models.Photo
});

Pixr.Collections.photos = new Pixr.Collections.Photos();
