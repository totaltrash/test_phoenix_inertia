// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
// import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import { InertiaApp } from '@inertiajs/inertia-vue'
import Vue from 'vue'
import Buefy from 'buefy'

// configure axios
import axios from "axios";
axios.defaults.xsrfHeaderName = "x-csrf-token";

Vue.use(Buefy)
Vue.use(InertiaApp)

const app = document.getElementById('app')

new Vue({
    render: h => h(InertiaApp, {
        props: {
            initialPage: JSON.parse(app.dataset.page),
            resolveComponent: name => require(`./pages/${name}`).default,
        },
    })
}).$mount(app)
