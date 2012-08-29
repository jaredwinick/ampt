ampt - Animated Mapping Toochain
====
Get ampt, bro!

This project aims to provide some instructions and examples for building animated visualizations of spatiotemporal data. 

## Examples
**A Day of Tweets** 
Video: http://youtu.be/WpuYzFmEPrE?hd=1
Code: https://github.com/jaredwinick/ampt/tree/master/examples/ampt-Tweets  

**2011 Tornado and Hail Activity**
Video: http://youtu.be/R3-4e9a56qM?hd=1
Code: https://github.com/jaredwinick/ampt/tree/master/examples/ampt-Weather-2011  

## Instructions
These instructions need more detail, but hopefully combined with the examples, it is enough to get you started.
* Find some data that has both temporal and spatial features. 
* Format your data in a CSV file with the a header identifying the columns. The temporal feature should be formatted as a unix timestamp and given a column header of *timestamp*. The spatial features should be a latitude and longitude with headers *lat* and *lon* respectively.
* Create a project in Tilemill and add your CSV file as a layer.
* Design your map.
* Copy your Tilemill project directory
* Copy the *get_ampt.py* script template to your new project directory
* Fill in your values for all the constants in *get_ampt.py*
* Update the copied *style.mss* to add in conditioning that will enable only data within a given timeframe to be shown for a video frame. Add *[timestamp>=%d][timestamp<%d]* next to the id controlling the styling for your data layer.
* Edit the *project.mml* and change *style.mss* to *style_modified.mss*

