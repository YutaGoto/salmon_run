/* eslint no-console: 0 */
// import Vue from 'vue'

import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

new Vue({
  el: '#salmon-show',
  data () {
    return {
      stage: {},
      weapons: [],
    };
  },
  mounted () {
    var d = document.getElementById('salmon-show');
    axios.get('/api/stages/' + d.getAttribute('data-event-id')).then((res) => {
      this.stage = res.data.data;
      this.weapons = res.data.weapons;
    });
  },

});