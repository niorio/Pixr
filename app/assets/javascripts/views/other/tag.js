Pixr.Views.Tag = Backbone.View.extend({
  tagName: 'li',

  render: function (){
    var link = $('<a>');
    link.attr('href', '#/tags/' + this.model.id);
    link.text(this.model.escape('name'));
    this.$el.html(link);
    return this;
  }

})
