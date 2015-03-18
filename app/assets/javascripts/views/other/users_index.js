Pixr.Views.UsersIndex = Backbone.View.extend({

  intitialize: function(options){
    this.followers = options.followers;
    this.followees = options.followees;
    this.listenTo(this.followees, 'sync', this.render);
    this.listenTo(this.followers, 'sync', this.render);

  },

  template: JST['users/index'],

  render: function(){
    content = this.template();
    this.$el.html(content);
    return this;

  }




});
