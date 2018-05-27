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
We exctract our types into a const to keep our types consistent
between actions & reducers. This is conventtion
*/
export function fetchWeather(city) {
  const url = `${ROOT_URL}&q=${city},us`;
  const request = axios.get(url);

  /* note that we are returning the promise as the payload key here*/
  return {
    type: 'FETCH_WEATHER',
	payload: request
  };
}
