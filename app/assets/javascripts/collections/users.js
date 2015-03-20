Pixr.Collections.FollowedUsers = Backbone.Collection.extend({

  model: Pixr.Models.User,

  url: 'api/users/following'

});

Pixr.Collections.Followers = Backbone.Collection.extend({
  model: Pixr.Models.User,

  url: 'api/users/followers'
});

Pixr.Collections.UserSearchResults = Backbone.Collection.extend({
  model: Pixr.Models.User,

  url: 'api/users/search'
})

Pixr.Collections.followees = new Pixr.Collections.FollowedUsers();
