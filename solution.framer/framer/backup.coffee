# This imports all the layers for "sketch-example" into sketchExampleLayers
sketchExampleLayers = Framer.Importer.load "imported/sketch-example"
layers = sketchExampleLayers

menu = layers.menu
header = layers.header
headerActive = layers.headerActive

menu.y = - menu.height
headerActive.opacity = 0

menu.states.animationOptions =
    curve: "bezier-curve(.66,.23,.61,1)"
    time: .2
headerActive.states.animationOptions =
    curve: "bezier-curve(.66,.23,.61,1)"
    time: .2

menu.states.add 'active', y: header.height - 12
headerActive.states.add 'active', opacity: 1

header.on 'click', ->
	menu.states.next()
	headerActive.states.next()