#Pipe each coordinate data into leaflet.

sasscal_mapper<-leaflet(data = allcoords) %>%
  addTiles() %>%
  setMaxBounds(17, -16.544627, 35, -30) %>%
  #addProviderTiles(providers$CartoDB.Positron)  %>%
  addMarkers(~long, ~lat, label= ~name)
sasscal_mapper

