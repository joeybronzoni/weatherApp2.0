import axios from 'axios';

const API_KEY ="4e93dcc7568b48181fe68e883aede969";
const ROOT_URL = `https://api.openweathermap.org/data/2.5/forecast?appid=${API_KEY}`;
/* This url will return something a little different
   const ROOT_URL = `https://api.openweathermap.org/data/2.5/weather?appid=${API_KEY}`;
*/
/* or might try this
https://api.openweathermap.org/data/2.5/weather?lat=40.749&lon=-74.2639&units=Imperial&APPID=4e93dcc7568b48181fe68e883aede969 */
/*
    var key ="&APPID=4e93dcc7568b48181fe68e883aede969",
      url ="api.openhweathermap.org/data/2.5/weather?",
      Geo={},//push geolocation into Geo={}
      WeatherUrl = "api.openweathermap.org/data/2.5/weather?"+"lat="+Geo.lat+'&lon='+Geo.lng+key;
  */
export const FETCH_WEATHER = 'FETCH_WEATHER';
/*
We extract our types into a const to keep our types consistent
between actions & reducers. This is conventtion. fetchWeather() is our action creator
*/
export function fetchWeather(city) {
  const url = `${ROOT_URL}&q=${city},us`;
  /* axios returns a promise by default*/
  const request = axios.get(url);
  console.log('Request/Promise: ',request);
  /* note that we are assigning the promise to the payload key here, and
   note that the promise itself doesn't actually contain our data but redux-promise(middleware)
   sees the promise And stops the action entirely and once the request finishes it
   dispatches a new action of the same type but with a payload of the
   resolved request so really it just unwrapps the promise for us
   Ahh, the beauty of middleware*/
  return {
    type: FETCH_WEATHER,
	payload: request
  };
}
