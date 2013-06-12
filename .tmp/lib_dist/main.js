(function() {
  define('app/models/todo', ["backbone"], function(Backbone) {
    var todo;
    todo = Backbone.Model.extend({
      defaults: {
        title: ""
      }
    });
    return todo;
  });

}).call(this);
