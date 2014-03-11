{View} = require 'atom'

module.exports =
class HipsterIpsumView extends View
  @content: ->
    @div class: 'hipster-ipsum overlay from-top', =>
      @div "The HipsterIpsum package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "hipster-ipsum:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "HipsterIpsumView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
