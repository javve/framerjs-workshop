# This imports all the layers for "sketch-example" into sketchExampleLayers
sketchExampleLayers = Framer.Importer.load "imported/sketch-example"
layers = sketchExampleLayers

# Create varibles to make it easier to access
# different layers
menu = layers.menu
header = layers.header
headerActive = layers.headerActive

# Move menu to default postion
menu.y = - menu.height
# Hide the active menu
headerActive.opacity = 0

# Set animation options (try play around with them)
menu.states.animationOptions =
    curve: "bezier-curve(.66,.23,.61,1)"
    time: .2
headerActive.states.animationOptions =
    curve: "bezier-curve(.66,.23,.61,1)"
    time: .2

# Move the menu so that the top is the same level
# as the bottom of the header (- 12 is because we need
# to take the shadow in account)
menu.states.add 'active',
	y: header.height - 12
# Show the headerActive layer when showing the menu
headerActive.states.add 'active',
	opacity: 1

# Toggle states on click
header.on 'click', ->
	menu.states.next()
	headerActive.states.next()