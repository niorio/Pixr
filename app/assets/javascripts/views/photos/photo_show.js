Pixr.Views.PhotoShow = Backbone.View.extend({

  template: JST['photos/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var content = this.template({ photo: this.model });
    this.$el.html(content);
    return this;
  }


});
