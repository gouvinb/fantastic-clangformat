{CompositeDisposable} = require 'atom'

module.exports = FormatterClangformat =
  activate: (state) ->
    return

  config:
    a:
      title: 'Path to the exectuable'
      type: 'object'
      properties:
        executablePath:
          title: 'Full path of exectuable'
          type: 'string'
          default: 'clang-format'
    c:
      title: 'C language'
      type: 'object'
      description: 'All parameters for C language.'
      properties:
        enable:
          title: 'Enable formatter for C language'
          type: 'boolean'
          default: true
        argumentsC:
          title: 'Arguments passed to the formatter C language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/c/.clang-format"`'
    cpp:
      title: 'C++ language'
      type: 'object'
      description: 'All parameters for C++ language.'
      properties:
        enable:
          title: 'Enable formatter for C++ language'
          type: 'boolean'
          default: true
        argumentsCpp:
          title: 'Arguments passed to the formatter C++ language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/cpp/.clang-format"`'
    objc:
      title: 'Objective-c language'
      type: 'object'
      description: 'All parameters for Objective-c language.'
      properties:
        enable:
          title: 'Enable formatter for Objective-c language'
          type: 'boolean'
          default: true
        argumentsObjc:
          title: 'Arguments passed to the formatter Objective-c language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/objc/.clang-format"`'
    java:
      title: 'Java language'
      type: 'object'
      description: 'All parameters for Java language.'
      properties:
        enable:
          title: 'Enable formatter for Java language'
          type: 'boolean'
          default: true
        argumentsJava:
          title: 'Arguments passed to the formatter Java language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/java/.clang-format"`'
    js:
      title: 'Js language'
      type: 'object'
      description: 'All parameters for Js language.'
      properties:
        enable:
          title: 'Enable formatter for Js language'
          type: 'boolean'
          default: true
        argumentsJs:
          title: 'Arguments passed to the formatter Js language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/js/.clang-format"`'

  provideFormatter: ->
    [
      {
        selector: '.source.c'
        getNewText: (text) ->
          if atom.config.get 'formatter-clangformat.c.enable'
            child_process = require 'child_process'
            return new Promise (resolve, reject) ->
              command = atom.config.get 'formatter-clangformat.a.executablePath'
              args = atom.config.get 'formatter-clangformat.c.argumentsC'
              toReturn = []
              process = child_process.spawn(command, args, {})
              process.stdout.on 'data', (data) -> toReturn.push data
              process.stdin.write text
              process.stdin.end()
              process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      }
      {
        selector: '.source.cpp'
        getNewText: (text) ->
          if atom.config.get 'formatter-clangformat.cpp.enable'
            child_process = require 'child_process'
            return new Promise (resolve, reject) ->
              command = atom.config.get 'formatter-clangformat.a.executablePath'
              args = atom.config.get 'formatter-clangformat.argumentsCpp'
              toReturn = []
              process = child_process.spawn(command, args, {})
              process.stdout.on 'data', (data) -> toReturn.push data
              process.stdin.write text
              process.stdin.end()
              process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      }
      {
        selector: '.source.objc'
        getNewText: (text) ->
          if atom.config.get 'formatter-clangformat.objc.enable'
            child_process = require 'child_process'
            return new Promise (resolve, reject) ->
              command = atom.config.get 'formatter-clangformat.a.executablePath'
              args = atom.config.get 'formatter-clangformat.argumentsObjc'
              toReturn = []
              process = child_process.spawn(command, args, {})
              process.stdout.on 'data', (data) -> toReturn.push data
              process.stdin.write text
              process.stdin.end()
              process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      }
      {
        selector: '.source.java'
        getNewText: (text) ->
          if atom.config.get 'formatter-clangformat.java.enable'
            child_process = require 'child_process'
            return new Promise (resolve, reject) ->
              command = atom.config.get 'formatter-clangformat.a.executablePath'
              args = atom.config.get 'formatter-clangformat.argumentsJava'
              toReturn = []
              process = child_process.spawn(command, args, {})
              process.stdout.on 'data', (data) -> toReturn.push data
              process.stdin.write text
              process.stdin.end()
              process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      }
      {
        selector: '.source.js'
        getNewText: (text) ->
          if atom.config.get 'formatter-clangformat.js.enable'
            child_process = require 'child_process'
            return new Promise (resolve, reject) ->
              command = atom.config.get 'formatter-clangformat.a.executablePath'
              args = atom.config.get 'formatter-clangformat.argumentsJs'
              toReturn = []
              process = child_process.spawn(command, args, {})
              process.stdout.on 'data', (data) -> toReturn.push data
              process.stdin.write text
              process.stdin.end()
              process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      }
    ]
