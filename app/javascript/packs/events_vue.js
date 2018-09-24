/* eslint no-console: 0 */
// import Vue from 'vue'
// import App from '../app.vue'

import Vue from 'vue/dist/vue.esm'
import axios from 'axios';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: "#openingEvent",
    data: function() {
      return {
        isOpen: false,
        opening_event: {},
      }
    },
    mounted () {
      axios.get('/api/events/open').then(res => {
        this.isOpen = res.data.data.is_open
        this.opening_event = res.data.data.event
      })
    }
  });
})
