# Pixr

[Live Site][live]

Pixr is a Flickr-style photo-sharing site built in Rails and Backbone.

##Features
- Users can upload photos and create albums.
- Users can comment on each other's photos, and fav them.
- Photos can be tagged and viewed by tag.
- Users can follow each other and view a feed of follower photos.
- Photos can be marked private, and they will not be visible to other users.

##Technical details
- Custom authentication using BCrypt
- Twitter login with OmniAuth
- After login, front-end is done entirely with Backbone.js, consuming JSON from the Rails API.
- Photo storage implemented with [Paperclip][paperclip] and Amazon S3
- A count of likes is stored using Rails cache_counter to cut down on queries
- get request for individual photo includes comments and author information
- Justified photo grid done with the [Justified Gallery][JG] plugin

##TODO
- user avatars
- drag and drop upload
- photo search across entire site
- draggable album reordering

[live]: https://www.pixr.pics/
[paperclip]: https://github.com/thoughtbot/paperclip
[JG]: https://github.com/miromannino/Justified-Gallery
