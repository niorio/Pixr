# Pixr

[Heroku link][heroku]

[heroku]: https://pixr-photos.herokuapp.com/

## Minimum Viable Product
Pixr is a clone of Flickr built on Rails and Backbone. Users can:

- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Upload Photos
- [ ] Create Photo Albums
- [ ] View photos and albums
- [ ] Comment on Photos
- [ ] Friend each other
- [ ] Like Photos
- [ ] Tag photos
- [ ] View friend's shared photos


## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Albums (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users should be able to create accounts,
log in/out, and create or view albums

[Details][phase-one]

### Phase 2: Viewing Photos and Albums (~2-3 days)
I will add API routes to serve photo data as JSON, then add Backbone
models and collections that fetch data from those routes. I will integrate
filepicker for photo uploads.  I plan to create photo albums that users can
create and view.  This will mean implementing an album index and show view. By
the end of this phase, users will be able to upload photos and view them, and
create and view albums.

[Details][phase-two]

### Phase 3: Comments and Likes (~2 days)
During this phase, I will create comments and likes that are associated with
photos, both of which will be visible on the photo show page, with a form for
new comments and button for likes.  Data for likes and comments will sent by the
photos controller and parsed client-side.

[Details][phase-three]

### Phase 4: Tags (~1 day)
Users can create tags that are linked to photos through tagging associations.
Clicking on a tag will bring up a tag show page, with all pictures with a given
tag. Users can also remove taggings.

[Details][phase-four]

### Phase 5: Friends (~2 days)
I will create a 'friends' association between users.  This will go hand in hand
with a 'privacy' attribute for photos: photos can be private, public, or shared
with friends.  This phase will also require a friends search feature, and a
friends index page for users to see their existing friends.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Pagination/infinite scroll
- [ ] Photo Metadata
- [ ] User avatars
- [ ] Photo search
- [ ] Draggable album organization
- [ ] Drag and Drop upload

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
