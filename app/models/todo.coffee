define 'app/models/todo', ["backbone"], (Backbone) ->
  todo = Backbone.Model.extend(defaults:
    title: ""
  )
  todo