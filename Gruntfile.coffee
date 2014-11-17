module.exports = (grunt) ->
  grunt.initConfig
    gitclone:
      content:
        options:
          repository: 'git@github.com:gregoryjscott/content.git'
          branch: 'master'
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
          config: '_config.yml,_tmp/content/_config.yml'

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

      cname:
        src: 'CNAME'
        dest: '_tmp/content/'

    'gh-pages':
      options:
        base: '_site',
        repo: 'git@github.com:gregoryjscott/gregoryjscott.github.io.git'
        branch: 'master'
        message: 'Generated by me'
      src: ['**']

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
  grunt.loadNpmTasks 'grunt-gh-pages'

  grunt.registerTask 'build', [
    'clean:build'
    'gitclone:content'
    'gitclone:design'
    'copy:design'
    'copy:cname'
    'jekyll:build'
  ]