# formatter-clangformat

Formatter for C, C++, Objective-C, Java, Javascript, and Protobuf.

This Formatter plugin for [Formatter](https://atom.io/packages/formatter)
provides an interface to
[clang-format](http://clang.llvm.org/docs/ClangFormat.html).

## Installation

1.  Install clang-format (ex: on OSX with brew -> `brew install clang-format`)

2.  Install [Formatter](https://atom.io/packages/formatter) package via Atom

    -   *or with* `apm install formatter`

3.  Install formatter-clangformat package via Atom

    -   *or with* `apm install formatter-clangformat`

## Usage

### In your source compatible file

Default (inspired from IntelliJ):

```cson
'atom-text-editor':
  'alt-ctrl-l': 'formatter:format-code'
  'alt-cmd-l': 'formatter:format-code'
```

### Format on save

Add these lines to your init.coffee script (Edit > Init Script...) :

```coffee
atom.workspace.observeTextEditors (editor) ->
  editor.buffer.onWillSave ->
    atom.commands.dispatch(atom.views.getView(editor), 'formatter:format-code')
```

### List of config

-   Path to the exectuable

    -   **Full path** clang-format

-   C language

    -   Enable formatter for C language (*need restart Atom*)

    -   Arguments passed to the formatter C language

        -   Example : `-assume-filename=/usr/local/mycfg/c/.clang-format`

-   C++ language

    -   Enable formatter for C++ language (*need restart Atom*)

    -   Arguments passed to the formatter C++ language

        -   Example : `-assume-filename=/usr/local/mycfg/cpp/.clang-format`

-   Objective-c language

    -   Enable formatter for Objective-c language (*need restart Atom*)

    -   Arguments passed to the formatter Objective-c language

        -   Example : `-assume-filename=/usr/local/mycfg/objc/.clang-format`

-   Java language

    -   Enable formatter for Java language (*need restart Atom*)

    -   Arguments passed to the formatter Java language

        -   Example : `-assume-filename=/usr/local/mycfg/java/.clang-format`

-   Javascript language'

    -   Enable formatter for Javascript language (*need restart Atom*)

    -   Arguments passed to the formatter Javascript language

        -   Example : `-assume-filename=/usr/local/mycfg/js/.clang-format`

-   TypeScript language'

    -   Enable formatter for TypeScript language (*need restart Atom*)

    -   Arguments passed to the formatter TypeScript language

        -   Example : `-assume-filename=/usr/local/mycfg/ts/.clang-format`

-   Protobuf language'

    -   Enable formatter for Protobuf language (*need restart Atom*)

    -   Arguments passed to the formatter Protobuf language

        -   Example : `-assume-filename=/usr/local/mycfg/proto/.clang-format`

## TODO

-   [ ] optimize enable config
-   [ ] cursor position
-   [ ] more optimization ?

## Contributing

1.  Fork it!
2.  Create your feature branch: `git checkout -b my-new-feature`
3.  Commit your changes: `git commit -am 'Add some feature'`
4.  Push to the branch: `git push origin my-new-feature`
5.  Submit a pull request :D

## License

See [LICENSE.md](./LICENSE.md)
