Pixr.Collections.FollowedUsers = Backbone.Collection.extend({

  model: Pixr.Models.User,

  url: 'api/users/following'

})

Pixr.Collections.Followers = Backbone.Collection.extend({
  model: Pixr.Models.User,

  url: 'api/users/followers'
})
