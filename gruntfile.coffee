# =================================
# $ npm install -g coffee-script
# $ npm install
# =================================
# $ grunt
# =================================

module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-notify')
  grunt.loadNpmTasks('grunt-exec')


  grunt.initConfig
    options:
      outputName: 'main.js'

    coffee:
      compile:
        options:
          sourceMap: false
          join     : false
        files:
          'lib_dist/<%= options.outputName %>': 'app/**/*.coffee'
          '.tmp/spec/index.js': 'spec/index.coffee'
          '.tmp/spec/SpecRunner.js': 'spec/SpecRunner.coffee'
          '.tmp/spec/spec.js': 'spec/*/**/*.coffee'

    connect:
      server:
        options:
          port: 8000
          base: './.tmp'

    copy:
      main:
        files: [
          expand: true
          src: [
            'vendor/*'
            'spec/index.html'
            'lib_dist/*'
          ]
          dest: '.tmp/'
        ]

    clean: [
      '.tmp/**/*'
    ]

    watch:
      scripts:
        files: ['spec/*', 'app/*', 'vendor/*']
        tasks: ['exec','notify:watch_done']

    exec:
      jasmine:
        command: "phantomjs vendor/run-jasmine.js http://localhost:8000/spec"
        stdout: true

    notify:
      spec_done:
        options:
          title: "Notification SUCCESS"
          message: "Good Job EXEC TEST are DONE !!!"

      watch_done:
        options:
          title: "Notification SUCCESS"
          message: "SAVE & Rebuild DONE !!!"

  grunt.registerTask 'default', ['clean', 'coffee', 'copy', 'connect', 'exec', 'notify:spec_done', 'watch', 'notify:watch_done']