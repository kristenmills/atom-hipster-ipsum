HipsterIpsumView = require './hipster-ipsum-view'

module.exports =
  hipsterIpsumView: null

  activate: (state) ->
    @hipsterIpsumView = new HipsterIpsumView(state.hipsterIpsumViewState)

  deactivate: ->
    @hipsterIpsumView.destroy()

  serialize: ->
    hipsterIpsumViewState: @hipsterIpsumView.serialize()
