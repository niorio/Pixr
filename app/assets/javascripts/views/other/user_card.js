Pixr.Views.UserCard = Backbone.View.extend({

  className: 'user-card group',

  intitialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  events: {
    'click .follow': 'follow',
    'click .unfollow': 'unfollow'
  },

  render: function () {
    this.$el.empty();

    var name = $('<h3>').text(this.model.escape('username'));
    var button = $('<button>');
    if (this.model.get('following')){
      button.addClass('unfollow');
      button.text('unfollow');
    } else {
      button.addClass('follow');
      button.text('follow');
    }

    this.$el.append(name);

    if (!this.model.get("me")){
      this.$el.append(button);
    }

    return this;
  },


  follow: function (){
    var followee = this.model;
    var view = this;
    var collection = Pixr.Collections.followees;

    $.ajax({
      url:'api/follows',
      method: 'post',
      datatype: "json",
      data: {followee_id: followee.id},
      success: function () {
        followee.set({following: true});
        collection.add(followee);
        view.render();
      }
    });
  },


  unfollow: function (){
    var followee = this.model;
    var view = this;
    var collection = Pixr.Collections.followees;

    $.ajax({
      url:'api/follows/' + followee.id,
      method: 'delete',
      datatype: "json",
      success: function () {
        followee.set({following: false});
        collection.remove(followee);
        view.render();
      }
    });
  }


})
