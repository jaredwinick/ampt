library(ggplot2)

source("5-transparent_background.R")

plotLatLonSaveAsPng = function() {
	p <- plotLatLonWithTransparentBackground()
	png( "6-save_as_png.png", width = 400, height = 400, units = "px", bg = "transparent" )
	print( p )
	dev.off()
}