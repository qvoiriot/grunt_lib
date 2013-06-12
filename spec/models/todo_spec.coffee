define 'spec/models/todo_spec', ["app/models/todo"], (Todo) ->
  describe "Todo Model", ->
    it "should have a default empty string title", ->
      t = new Todo()
      expect(t.get("title")).toBe ""