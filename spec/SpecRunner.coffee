require.config
  baseUrl:"/app"
  urlArgs: "cb=" + Math.random()
  paths:
    jquery: "../vendor/jquery"
    underscore: "../vendor/underscore"
    backbone: "../vendor/backbone"
    spec: "../spec/"
    app: "../app/"

  shim:
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

require ["jquery", "spec/index"], ($, index) ->
  jasmineEnv = jasmine.getEnv()
  htmlReporter = new jasmine.HtmlReporter()
  jasmineEnv.addReporter htmlReporter
  jasmineEnv.specFilter = (spec) ->
    htmlReporter.specFilter spec

  $ ->
    require index.specs, ->
      jasmineEnv.execute()