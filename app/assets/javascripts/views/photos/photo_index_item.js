Pixr.Views.PhotoIndexItem = Backbone.View.extend({

  template: JST['photos/indexItem'],

  tagName: 'a',

  attributes: function() {
    return { href: "#/photos/" + this.model.id};
  },

  render: function () {
    var content = this.template({ photo: this.model });
    this.$el.html(content);
    return this;
  },


})
