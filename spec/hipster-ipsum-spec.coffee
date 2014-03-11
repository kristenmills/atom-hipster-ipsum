HipsterIpsum = require '../lib/hipster-ipsum'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "HipsterIpsum", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('hipsterIpsum')

  describe "when the hipster-ipsum:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.hipster-ipsum')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'hipster-ipsum:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.hipster-ipsum')).toExist()
        atom.workspaceView.trigger 'hipster-ipsum:toggle'
        expect(atom.workspaceView.find('.hipster-ipsum')).not.toExist()
