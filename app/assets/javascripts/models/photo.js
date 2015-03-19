Pixr.Models.Photo = Backbone.Model.extend({
  urlRoot: '/api/photos',

  comments: function () {
    if (!this._comments){
      this._comments = new Pixr.Collections.Comments({}, {photo_id: this.id});
    }
    return this._comments
  },

  owner: function () {
    if (!this._owner){
      this._owner = new Pixr.Models.User();
    }
    return this._owner;
  },

  tags: function () {
    if (!this._tags){
      this._tags = new Backbone.Collection();
    }
    return this._tags;
  },

  parse: function(response) {
    if (response.comments){
      this.comments().set(response.comments);
      delete response.comments;
    }
    if (response.owner){
      this.owner().set(response.owner);
      delete response.owner;
    }
    if (response.tags){
      this.tags().set(response.tags);
      delete response.tags;
    }

    return response;
  },

  toJSON: function () {
    return { photo: _.clone(this.attributes) }
  }

});
