window.Pixr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Pixr.Routers.router({$rootEl: $('#content')});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Pixr.initialize();
});
