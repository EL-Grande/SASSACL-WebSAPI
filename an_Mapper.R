#Pipe the coordinate data into leaflet.
an<-leaflet(data = ancoords) %>%
  addTiles() %>%
  setMaxBounds(-5, 6.544627, 25.635832, -38.031361) %>%
  #addProviderTiles(providers$CartoDB.Positron)  %>%
  addMarkers(~long, ~lat, label= ~name)
an