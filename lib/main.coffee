HipsterIpsum = require './hipster-ipsum'

module.exports =
  configDefaults:
    defaultNumberOfParagraphs: 4
    includeParagraphTags: false
    useHipsterLatin: false

  activate: (state) ->
    new HipsterIpsum()
