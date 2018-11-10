/* eslint no-console: 0 */
// import Vue from 'vue'

import Vue from "vue/dist/vue.esm";
import axios from "axios";

var app = new Vue({
  el: "#salmon-show",

  data () {
    return {
      event: {},
    };
  },
  mounted () {
    var d = document.getElementById("salmon-show");
    axios.get("/api/events/" + d.getAttribute("data-event-id")).then((res) => {
      this.event = res.data.data;
    });
  },

});