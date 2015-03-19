Pixr.Views.UsersIndex = Backbone.CompositeView.extend({

  initialize: function(options){
    this.followers = options.followers;
    this.followees = options.followees;
    this.listenTo(this.followees, 'sync change', this.render);
    this.listenTo(this.followers, 'sync change', this.render);

  },

  template: JST['users/index'],

  render: function(){
    content = this.template();
    this.$el.html(content);
    var view = this;
    var userView;

    this.followers.each( function(follower) {
      userView = new Pixr.Views.UserCard({ model: follower })
      view.addSubview('.followers-list', userView)
    });

    this.followees.each( function(follower) {
      userView = new Pixr.Views.UserCard({ model: follower })
      view.addSubview('.following-list', userView)
    });

    return this;

  }




});
