Backbone.ModalView = Backbone.View.extend({
  initialize: function(options){
    this.callback = options.callback;
    this.message = options.message;
  },

  events: {
    'click .confirm': 'confirm',
    'click .cancel': 'remove',
    'click .shroud': 'doNothing'
  },

  classname: "modal",

  template: JST['utils/modal'],

  render: function () {
    content = this.template({ message: this.message });
    this.$el.html(content);
    return this;
  },

  confirm: function (){
    this.callback();
    this.remove();
  },

  doNothing: function(event){
    event.preventDefault();
  }


})
