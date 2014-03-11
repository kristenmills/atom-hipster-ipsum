RangeFinder = require './range-finder'

moudle.exports =
class HipsterIpusm

  constructor: ->
    atom.workspaceView.command 'hipster-ipsum:paragraphs', '.editor', ->
      editor = atom.workspaceView.getActivePaneItem()
      @generate(editor)

  generate: (editor) ->
    ranges = RangeFinder.rangesFor(editor)

    selection = editor.getTextInBufferRange(ranges[0])

    if selection.match /^\d+$/
      paragraphs = getParagraph(selection.parseInt())
    else
      paragraphs = getParagraph(atom.config.get('hipster-ipsum.defaultNumberOfParagraphs'))

    if selection == ''
      editor.setTextAtCursorPosition(paragraphs)
    else
      editor.setTextInBufferRange(ranges[0], paragraphs)

  getParagraphs: (num) ->
    if atom.config.get('hipster-ipsum.useHipsterLatin')
      type = 'hipster-latin'
    else
      type = 'hipster-centric'

    if atom.config.get('hipster-ipsum.includeParagraphTags')
      html = true
    else
      html = false
      
    $.getJson "http://hipsterjesus.com/api/?paras=#{num}&type=#{type}&html=#{html}", (data) ->
      return data.text
