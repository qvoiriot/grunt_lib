require.config
  urlArgs: "cb=" + Math.random()
  paths:
    jquery: "../vendor/jquery"
    underscore: "../vendor/underscore"
    backbone: "../vendor/backbone"
    spec: "../spec"
    app: "../lib_dist"

  shim:
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

require ["jquery", "spec/index", "spec/spec", "app/main"], ($, index) ->
  jasmineEnv = jasmine.getEnv()
  htmlReporter = new jasmine.HtmlReporter()
  jasmineEnv.addReporter htmlReporter
  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec

  $ ->
    require index.specs, ->
      jasmineEnv.execute()