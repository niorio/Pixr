Pixr.Views.UsersIndex = Backbone.CompositeView.extend({

  initialize: function(){
    this.listenTo(this.collection, 'sync add remove', this.render);

  },

  template: JST['users/index'],

  render: function(){
    content = this.template();
    this.$el.html(content);
    var view = this;
    var userView;

    this.collection.each( function(follower) {
      userView = new Pixr.Views.UserCard({ model: follower, collection: view.collection })
      view.addSubview('.following-list', userView)
    });

    return this;

  }




});
