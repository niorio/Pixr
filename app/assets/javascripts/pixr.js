window.Pixr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Pixr.Routers.Photos({$rootEl: $('#content')});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Pixr.initialize();
});
