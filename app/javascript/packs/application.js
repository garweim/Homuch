import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import Chartkick from "chartkick";
import Chart from "chart.js";
import { initAutocomplete } from '../components/init_autocomplete';
import { initMapbox } from '../components/init_map';
import { cardFlipper } from '../components/card_flipper';

require("chartkick");
require("chart.js");


Chartkick.use(Chart);
initMapbox();
initAutocomplete();
cardFlipper();







