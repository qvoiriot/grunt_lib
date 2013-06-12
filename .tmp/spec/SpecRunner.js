(function() {
  require.config({
    baseUrl: "/app",
    urlArgs: "cb=" + Math.random(),
    paths: {
      jquery: "../vendor/jquery",
      underscore: "../vendor/underscore",
      backbone: "../vendor/backbone",
      spec: "../spec/",
      app: "../app/"
    },
    shim: {
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      }
    }
  });

  require(["jquery", "spec/index"], function($, index) {
    var htmlReporter, jasmineEnv;
    jasmineEnv = jasmine.getEnv();
    htmlReporter = new jasmine.HtmlReporter();
    jasmineEnv.addReporter(htmlReporter);
    jasmineEnv.specFilter = function(spec) {
      return htmlReporter.specFilter(spec);
    };
    return $(function() {
      return require(index.specs, function() {
        return jasmineEnv.execute();
      });
    });
  });

}).call(this);
