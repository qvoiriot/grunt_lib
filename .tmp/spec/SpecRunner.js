(function() {
  require.config({
    urlArgs: "cb=" + Math.random(),
    paths: {
      jquery: "../vendor/jquery",
      underscore: "../vendor/underscore",
      backbone: "../vendor/backbone",
      spec: "../spec",
      app: "../lib_dist"
    },
    shim: {
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      }
    }
  });

  require(["jquery", "spec/index", "spec/spec", "app/main"], function($, index) {
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
