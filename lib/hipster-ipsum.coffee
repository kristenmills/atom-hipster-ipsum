RangeFinder = require './range-finder'
$ = require 'jquery'

module.exports =
class HipsterIpusm

  constructor: ->
    atom.workspaceView.command 'hipster-ipsum:paragraphs', '.editor', =>
      editor = atom.workspaceView.getActivePaneItem()
      @generate(editor)

  generate: (editor) ->
    ranges = RangeFinder.rangesFor(editor)

    selection = editor.getTextInBufferRange(ranges[0])

    if selection.match /^\d+$/
      num = parseInt(selection, 10)
    else
      num = atom.config.get('hipster-ipsum.defaultNumberOfParagraphs')

    if atom.config.get('hipster-ipsum.useHipsterLatin')
      type = 'hipster-latin'
    else
      type = 'hipster-centric'

    if atom.config.get('hipster-ipsum.includeParagraphTags')
      html = true
    else
      html = false

    $.getJSON "http://hipsterjesus.com/api/?paras=#{num}&type=#{type}&html=#{html}", (data) ->
      editor.setTextInBufferRange(ranges[0], data.text.replace(/\n/g, '\n\n'))
