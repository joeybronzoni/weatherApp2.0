import React, { Component } from 'react';
import { connect } from 'react-redux';
import Chart from '../components/chart.js';
import GoogleMap from '../components/google_map';
/* Because this component  will need access the data this is a container not a component*/
class WeatherList extends Component {
  renderWeather(cityData){
	const name = cityData.city.name;
    const temps = cityData.list.map(weather => weather.main.temp);
	/* to do conversion to Celsius do it here like this:
	/ let  temps = _.map(cityData.list.map(weather => weather.main.temp), (temp) => temp -273);*/
	console.log('This is temp:', temps);
	const humidity = cityData.list.map(weather => weather.main.humidity);
	console.log('Humidity: ', humidity);
	const pressure = cityData.list.map(weather => weather.main.pressure);
	console.log('Pressure: ', pressure);
	/* Lets use es6 to restructure this lon & lat since we are using it more than once
	   const lon = cityData.city.coord.lon;
	   const lat = cityData.city.coord.lat;*/
	const { lon, lat } = cityData.city.coord;

	return (
	  <tr key={name}>
		<td><GoogleMap lon={lon} lat={lat}  /></td>
		<td><Chart data={temps} color={'#fa7e17'}  units="K"/></td>
		<td><Chart data={pressure} color={'blue'}  units="hPa"/></td>
		<td><Chart data={humidity} color={'black'} units="%"/></td>
	  </tr>
	);
  }
  render() {
    return (
      <table className="table table-hover">
		<thead>
		  <tr>
			<th>City</th>
			<th>Temperature (K)</th>
			<th>Pressure (hPa)</th>
			<th>Humidity (%)</th>
		  </tr>
		</thead>
		<tbody>
		  {this.props.weather.map(this.renderWeather)}
		</tbody>
	  </table>
	);
  }
}

function mapStateToProps({ weather }) {
  return { weather };
}
/* This mapStateToProps() is the same as writing:
   function mapStateToProps(state) {
   const weather = state.weather;
     return { weather: state.weather}
   }
   or:
   function mapStateToProps(weather) {
     return { weather: weather}
   }
   **Regardless, we always need to mapStateToProps() with redux
*/

export default connect(mapStateToProps)(WeatherList);

// Because this is redundant we should take this and create a function for DRY code:
/*
	return (
	  <tr key={name}>
		<td>{name}</td>
		<td>
		  <Sparklines height={80} width={120} data={temps}>
            <SparklinesLine color="#fa7e17" />
			<SparklinesReferenceLine type="mean" />
		  </Sparklines>
		</td>
		<td>
		  <Sparklines height={80} width={120} data={humidity}>
            <SparklinesLine color="#fa7e17" />
			<SparklinesReferenceLine type="mean" />
		  </Sparklines>
		</td>
		<td>
		  <Sparklines height={80} width={120} data={pressure}>
            <SparklinesLine color="#fa7e17" />
			<SparklinesReferenceLine type="mean" />
		  </Sparklines>
		</td>
	  </tr>
	);
*/
