# Pixr

[Live Site][live]

[live]: https://www.pixr.pics/

Pixr is a Flickr-style photo-sharing site built on Rails and Backbone.

##Features
- Users can upload photos and create albums.
- Users can comment on each other's photos, and fav them.
- Photos can be tagged and viewed by tag.
- Users can follow each other and view a feed of follower photos.

##Technical details
- Custom authentication using BCrypt
- After login, front-end is done entirely with Backbone.js, consuming JSON from the Rails API.
- Photo storage implemented with the Paperclip gem and Amazon S3
- A count of likes is stored using Rails' cache_counter to cut down on queries
- get request for individual photo includes comments and author information
- Justified photo grid done with the [Justified Gallery][JG] plugin
[JG]: https://github.com/miromannino/Justified-Gallery

##TODO
- drag and drop upload
- photo search across entire site
- OmniAuth for Twitter
- draggable album reordering
