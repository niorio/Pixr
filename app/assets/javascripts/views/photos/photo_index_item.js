Pixr.Views.PhotoIndexItem = Backbone.View.extend({

  template: JST['photos/indexItem'],

  tagName: 'li',

  className: 'imgcontainer group',

  render: function () {
    var content = this.template({ photo: this.model });
    this.$el.html(content);
    return this;
  }
})
