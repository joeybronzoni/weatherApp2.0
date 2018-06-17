import { combineReducers } from 'redux';
// The reducer/function that sends the action
import WeatherReducer from './reducer_weather';

const rootReducer = combineReducers({
  weather: WeatherReducer
});

export default rootReducer;
