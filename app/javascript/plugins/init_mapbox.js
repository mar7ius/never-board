import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/dark-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);

    if (markers) {
      addMarkerToMap(map, markers);
      fitMapToMarker(map, markers);
    }
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
  }
};

const fitMapToMarker = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  // if markers.length > 1
  // bounds.extend([ markers.lng, markers.lat ])
  // To use if it is for index
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkerToMap = (map, markers) => {

  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  })
}

export { initMapbox };
