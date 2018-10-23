/* eslint no-console: 0 */
// import Vue from 'vue'

import Vue from 'vue/dist/vue.esm'
import Router from './router/router'
import axios from 'axios';

var app = new Vue({
  el: "#salmon",

  data: function() {
    return {
      isOpen: false,
      opening_event: {},
      events: [],
      weapons: [],
      stages: [],
      selectedWeapon: "",
      selectedStage: "",
    }
  },
  mounted () {
    axios.get("/api/events/open").then((res) => {
      this.isOpen = res.data.data.is_open
      if (this.isOpen) {
        this.opening_event = res.data.data.event
      }
    });

    axios.get("/api/events").then((res) => {
      this.events = res.data.data;
    });

    axios.get("/api/weapons").then((res) => {
      this.weapons = res.data.data;
    });

    axios.get("/api/stages").then((res) => {
      this.stages = res.data.data;
    });
  },
  methods: {
    eventSearch: function () {
      axios.get("/api/events", {
        params: {
          weapons: this.selectedWeapon,
          stages: this.selectedStage,
        }
      }).then((res) => {
        this.events = res.data.data;
      });
    }
  }
});
