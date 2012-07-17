# http://www.r-tutor.com/r-introduction/data-frame/data-import
createDataFrame = function( ) {
	dataFrame = read.csv( "earthquakes_05292012.csv" )
	return( dataFrame )
}

printDataFrameInfo = function( dataFrame ) {
	# print dimensions (row x col)
	print( dim( dataFrame ) )
	
	# print a cell value
	print( dataFrame[1,1] )
	
	# print a row
	print( dataFrame[1,] )
	
	# print a column by index
	print( dataFrame[,1] )
	
	# print a column by column name
	print( dataFrame$Lat )
}
	
	