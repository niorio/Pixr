Pixr.Views.CommentShow = Backbone.View.extend({

  template: JST['comments/show'],

  tagName: 'li',
  
  events: {
    'click .delete-comment': 'destroyComment'
  },

  render: function () {
    var content = this.template({ comment: this.model });
    this.$el.html(content);
    return this;
  },

  destroyComment: function(event){
    var view = this;
    this.model.destroy({
      success: function (){
        view.remove();
      }
    });
  }


});
