import "bootstrap";

require("chartkick");
require("chart.js");

import Chartkick from "chartkick";
import Chart from "chart.js";

Chartkick.use(Chart);

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../components/init_map';

initMapbox();




