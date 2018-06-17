import { FETCH_WEATHER } from '../actions/index.js';

/* In this switch() we are adding on to our existing state, not replacing
   *Note the return in this switch() that was: 'return state.push(action.payload.data)'
   can be a rabbit hole- never manipulate state directly like 'this.state ='
*/
/* We could use: return state.concat([action.payload.data]); so
 concat doesn't change the existing array it just returns a new
 array that contains the old state with the  new state, a new version
we are setting the initial state= [] , action */
export default function(state = [], action) {
  /* this log and var is just to see the response *note that the only
     thing we reallly care about from the log is the action.payload.data in the obj
     the this is different than state.push(action.payload.data) that returns the same
     state just mutated/changed - this returns a new version of state. This idea is key in redux*/
  var myAction = JSON.stringify(action);
  console.log(`Action received: ${myAction}` );
  switch (action.type) {
	  case FETCH_WEATHER:
		// return state.concat([action.payload.data]); both will
		return [ action.payload.data, ...state ];
  }
  /* right now its redux-promise that cleans up our code
     and looks as if it's not asyncronous, redux-promise unwrapps our
     promise and gives us another 'action' for our data*/

  return state;
}
