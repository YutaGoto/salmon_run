/* eslint no-console: 0 */
// import Vue from 'vue'
// import App from '../app.vue'


import Vue from 'vue/dist/vue.esm'
import axios from 'axios';

window.onload = function(){
  const app = new Vue({
    el: '#events',
    components: {
      tbody: App,
    },
    data: function() {
      return {
        salmon_events: newEvent(),
      };
    },
  })
}

var newEvent = function() {
  axios.get('/api/events').then((response) => {
    return response.data.data;
  }, (error) => {
    console.log(error);
  });
}
