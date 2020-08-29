App.room = App.cable.subscriptions.create("AppearanceChannel", {
  connected: function() {
    console.log('open');
  },
  disconnected: function() {
    console.log('close');
  },
  received: function() {

  }
});
