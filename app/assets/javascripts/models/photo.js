Pixr.Models.Photo = Backbone.Model.extend({
  urlRoot: '/api/photos',

  comments: function () {
    if (!this._comments){
      this._comments = new Pixr.Collections.Comments({}, {photo_id: this.id});
    }
    return this._comments
  },

  parse: function(response) {
    if (response.comments){
      this.comments().set(response.comments);
      delete response.comments;
    }
    return response;
  }

});
