# Phase 2: Viewing Photos and Albums

## Rails
### Models

### Controllers
Api::PhotosController (create, destroy, index, show)
Api::AlbumsController (create, destroy, show, update)

### Views
* photos/show.json.jbuilder

## Backbone
### Models
* Album
* Photo

### Collections
* Photos
* Albums

### Views
* PhotoForm
* PhotoShow (composite view, contains PostsIndex subview)
* PhotosIndex (composite view, contains PostsIndexItem subviews)
* AlbumForm
* AlbumIndex
* AlbumShow

## Gems/Libraries
*Filepicker
