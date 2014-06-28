# Emoji.JS :tada:

Ever wanted to be able to write `:thumbsup:` and have :thumbsup: display on your blog? Me to. Let's make this happen...

## Getting Started
1. Get the gem: `gem install emoji-js`
2. Go to your project: `cd my-project`
3. Generate the files: `emoji-js`
  ```

  Project path: (default: current directory)
  Emoji graphics path: (default: "graphics/") [enter]
  Your project's JavaScript directory: (default: "js/") [enter]
  Emoji.JS successfully added to your project.
  Now add: '<script src="/js/emoji.min.js"></script>' to the END of your HTML file.

  ```
4. Append `<script src="/js/emoji.min.js"></script>` to the __END__ of any HTML files that you want this added to.
5. You're done! :tada:

### Why do I have to call this script at the end?
In order to understand this question, one must first understand how Emoji.JS works. Emoji.JS works by scanning the existing webpage for emoji names wrapped in colons (e.g. `:dog:`), then replaces them with the corrosponding emoji image. This allows for two things. First, it allows for easy emoji integration. Second, it allows for cross-platform use of emoji. Because of this, if the script is not called at the end of the document, there will be nothing to scan. Thus, it is __imperitive__ that you call the script at the end of `<body>`

... more docs to come!
