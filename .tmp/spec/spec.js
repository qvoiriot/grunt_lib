(function() {
  define('spec/models/todo_spec', ["app/models/todo"], function(Todo) {
    return describe("Todo Model", function() {
      return it("should have a default empty string title", function() {
        var t;
        t = new Todo();
        return expect(t.get("title")).toBe("");
      });
    });
  });

}).call(this);
