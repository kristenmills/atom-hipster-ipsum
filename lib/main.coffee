HipsterIpsum = require './hipster-ipsum'

module.exports =
  configDefaults:
    defaultNumberOfParagraphs: 4
    includeParagraphTags: false
    useHistperLatin: false

  activate: (state) ->
    new HipsterIpsum()
