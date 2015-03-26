Backbone.ModalView = Backbone.View.extend({
  initialize: function(options){
    this.callback = options.callback;
    this.message = options.message;
  },

  events: {
    'click .confirm': 'confirm',
    'click .cancel': 'remove'
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
  },

  doNothing: function(event){
    event.preventDefault();
  }


})
