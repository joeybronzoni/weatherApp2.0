import React, { Component } from 'react';

/*Because we have the google maps link in the index.html we can just start using the api, but googlemaps
doesnt know how we are rendering components but all that means is that we have to adjust the way we render it in
react and we already are familiar with using the googlemaps api so it shouldn't be that much of a shock*/
class GoogleMap extends Component {
  // lifecycle method gets called automatically after component renders to screen
  componentDidMount() {
	// creates an imbedded google-map in our element
	/* The 1st arg is simply referencing/telling the google-api where to render the map
	   The 2nd arg is the options object(the same we saw on vacationExchange)
	   * We are assuming that this component will be provided with the lat-lon coordinates, we will
	   have to convert the lng so that it matches our lon const names*/
	new google.maps.Map(this.refs.map, {
	  zoom: 12,
	  mapTypeId: 'hybrid',
	  center: {
		lat: this.props.lat,
		lng: this.props.lon
	  }
	});
  }
  /*note the difference in our return but also, remember the ref from vacationExchange? */
  render() {
    return <div ref="map" />;
  };
};
export default GoogleMap;
