/* eslint no-console: 0 */
// import Vue from 'vue'

import Vue from 'vue/dist/vue.esm.js';
import EventsShow from '../components/events_show.vue'

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: 'events-show',
    components: {
      EventsShow,
    }
  })
});
