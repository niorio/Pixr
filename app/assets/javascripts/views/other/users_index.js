Pixr.Views.UsersIndex = Backbone.CompositeView.extend({

  initialize: function(){
    this.listenTo(this.collection, 'sync add remove', this.render);
    this.searchResults = new Pixr.Collections.UserSearchResults();
    this.listenTo(this.searchResults, 'reset', this.showresults)

  },

  template: JST['users/index'],

  events: {
    'keypress .searchbox': 'search'
  },

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

  },

  search: function () {
    var query = $('.searchbox').val()
    this.searchResults.fetch({
      data: {
        query: query
      },
      reset: true
    });
  },

  showresults: function () {
    var view = this;
    var userView;

    this.searchResults.each( function(user) {
      userView = new Pixr.Views.UserCard({ model: user, collection: view.collection })
      view.addSubview('.search-results', userView);
    });
  }




});
