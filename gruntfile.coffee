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
    coffee:
      compile:
        options:
          sourceMap: false
          join     : false
        files:
          'lib_dist/main.js': 'app/*.coffee'
          '.tmp/app/todo.js': 'app/todo.coffee'
          '.tmp/spec/index.js': 'spec/index.coffee'
          '.tmp/spec/SpecRunner.js': 'spec/SpecRunner.coffee'
          '.tmp/spec/todo_spec.js': 'spec/todo_spec.coffee'

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
            'vendor/*',
            'spec/index.html'
          ]
          dest: '.tmp/'
        ]

    clean: [
      'lib_dist/*'
      '.tmp/vendor/*',
      '.tmp/spec/*',
      '.tmp/app/*'
    ]

    watch:
      scripts:
        files: ['spec/*.coffee', 'app/*.coffee', 'vendor/jasmine-html.js']
        tasks: ['exec','notify:Watch_done']

    exec:
      jasmine:
        command: "phantomjs vendor/run-jasmine.js http://localhost:8000/spec"
        stdout: true

    notify:
      Spec_done:
        options:
          title: "Notification"
          message: "Good Job Test are DONE !!!"

      Watch_done:
        options:
          title: "Notification"
          message: "Good Job Re-Build DONE !!!"

  grunt.registerTask 'default', ['clean', 'copy', 'coffee','connect','exec','notify:Spec_done','watch','notify:Watch_done']