import _ from 'lodash';
import React, { Component } from 'react';
import { Sparklines, SparklinesLine, SparklinesReferenceLine, SparklinesBars, SparklinesSpots, SparklinesNormalBand } from 'react-sparklines';

// This is a functional component and not a container because we already have access to the data  in the weather_list container
// * note that we turned our repeating pattern(comment at bottom of weather_list.js) into a reusable component

function average(data) {
  return _.round(_.sum(data)/data.length);
}

export default (props) => {
  return (
	<div>
	  <Sparklines svgHeight={80} svgWidth={120} data={props.data}>
        <SparklinesLine color={props.color} />
		<SparklinesReferenceLine type="avg" />
	  </Sparklines>
	  <div>{average(props.data)} {props.units}</div>
	</div>
  );
};
