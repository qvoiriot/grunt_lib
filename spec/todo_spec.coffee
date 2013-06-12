define ["app/todo"], (Todo) ->
  describe "Todo Model", ->
    it "should have a default empty string title", ->
      t = new Todo()
      expect(t.get("title")).toBe ""