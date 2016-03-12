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
          description: 'Need restart Atom.'
        arguments:
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
          description: 'Need restart Atom.'
        arguments:
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
          description: 'Need restart Atom.'
        arguments:
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
          description: 'Need restart Atom.'
        arguments:
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
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter Js language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/js/.clang-format"`'
    protobuf:
      title: 'Protobuf language'
      type: 'object'
      description: 'All parameters for Protobuf language.'
      properties:
        enable:
          title: 'Enable formatter for Protobuf language'
          type: 'boolean'
          default: true
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter Protobuf language'
          type: 'array'
          default: []
          description: 'Example : `-assume-filename="/usr/local/mycfg/protobuf/.clang-format"`'

  provideFormatter: ->
    [
      {
        selector: '.source.c'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-clangformat.a.executablePath'
            args = atom.config.get 'formatter-clangformat.c.argumentsC'
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-clangformat : error', {dismissable: true, detail: toReturnErr.join('\n')});
      } if atom.config.get 'formatter-clangformat.c.enable'
      {
        selector: '.source.cpp'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-clangformat.a.executablePath'
            args = atom.config.get 'formatter-clangformat.cpp.arguments'
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-clangformat : error', {dismissable: true, detail: toReturnErr.join('\n')});
      } if atom.config.get 'formatter-clangformat.cpp.enable'
      {
        selector: '.source.objc'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-clangformat.a.executablePath'
            args = atom.config.get 'formatter-clangformat.objc.arguments'
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning(toReturnErr.join('\n'));
      } if atom.config.get 'formatter-clangformat.objc.enable'
      {
        selector: '.source.java'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-clangformat.a.executablePath'
            args = atom.config.get 'formatter-clangformat.java.arguments'
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-clangformat : error', {dismissable: true, detail: toReturnErr.join('\n')});
      } if atom.config.get 'formatter-clangformat.java.enable'
      {
        selector: '.source.js'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-clangformat.a.executablePath'
            args = atom.config.get 'formatter-clangformat.js.arguments'
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-clangformat : error', {dismissable: true, detail: toReturnErr.join('\n')});
      } if atom.config.get 'formatter-clangformat.js.enable'
      {
        selector: 'source.protobuf'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-clangformat.a.executablePath'
            args = atom.config.get 'formatter-clangformat.protobuf.arguments'
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-clangformat : error', {dismissable: true, detail: toReturnErr.join('\n')});
      } if atom.config.get 'formatter-clangformat.protobuf.enable'
    ]
