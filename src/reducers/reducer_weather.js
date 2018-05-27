import { FETCH_WEATHER } from '../actions/index.js';

/* in this switch() we are adding on to our existing state, not replacing
   *Note the return in this switch() that was: 'return state.push(action.payload.data)'
   can be a rabbit hole- never manipulate state directly like 'this.state ='
*/
/* We could use this: return state.concat([action.payload.data]);
   so concat doesn't change the existing array it just
   returns a new array that contains the old state with the
   new, a new version */
export default function(state = [], action) {
  switch (action.type) {
	  case FETCH_WEATHER:
		return [ action.payload.data, ...state ];
  }
  /* write now its redux-promise that cleans up our code
     and looks as if it's not asyncronous, redux-promise unwrapps our
     promise and gives us another 'action' for our data*/

  return state;
}
