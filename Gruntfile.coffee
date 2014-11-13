module.exports = (grunt) ->
  grunt.initConfig
    gitclone:
      content:
        options:
          repository: 'git@github.com:gregoryjscott/content.git'
          branch: 'remove-resume'
          directory: '_tmp/content'

      design:
        options:
          repository: 'git@github.com:gregoryjscott/roomy.git'
          branch: 'master'
          directory: '_tmp/design'

    jekyll:
      build:
        options:
          src: '_tmp/content'
          plugins: '_plugins'
          dest: '_site'
          config: '_config.yml, _tmp/content/_config.yml'

    clean:
      build:
        src: ['_tmp/design', '_tmp/content']
        dot: true

    copy:
      design:
        expand: true
        cwd: '_tmp/design'
        src: '**'
        dest: '_tmp/content/'

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          keepalive: true

  grunt.loadNpmTasks 'grunt-git'
  grunt.loadNpmTasks 'grunt-jekyll'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.registerTask 'build', [
    'clean:build'
    'gitclone:content'
    'gitclone:design'
    'copy:design'
    'jekyll:build'
  ]
