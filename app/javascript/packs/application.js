import "bootstrap";

require("chartkick");
require("chart.js");

import Chartkick from "chartkick";
import Chart from "chart.js";

Chartkick.use(Chart);

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../components/init_map';
// import { initAutocomplete } from '../components/init_autocomplete';


initMapbox();

import { initAutocomplete } from '../components/init_autocomplete';

initAutocomplete();


