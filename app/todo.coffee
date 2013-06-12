define ["backbone"], (Backbone) ->
  todo = Backbone.Model.extend(defaults:
    title: ""
  )
  todo