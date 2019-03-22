/* eslint no-console: 0 */
// import Vue from 'vue'

import Vue from "vue/dist/vue.esm";
import axios from "axios";
import { csrfToken } from "rails-ujs";

axios.defaults.headers.common["X-CSRF-Token"] = csrfToken();

var app = new Vue({
  el: "#salmon",

  data () {
    return {
      isOpen: false,
      openingEvent: {},
      events: [],
      stages: [],
      selectedWeapon: null,
      selectedStage: null,
    };
  },
  mounted () {
    axios.post("/graphql", {
      query: `{
        events{
          id
          startAt
          endAt
          hours
          stage { name }
          eventsWeapons { weapon{ name imageUrl } }
        }
        opening{
          id
          startAt
          endAt
          hours
          stage { name }
          eventsWeapons { weapon{ name imageUrl countText} sinceLastEventTimes }
        }
      }`,
      variables: null
    }).then((res) => {
      this.events = res.data.data.events;
      if (res.data.data.opening != null){
        this.isOpen = true;
        this.openingEvent = res.data.data.opening;
      }
    });

    axios.get("/api/stages").then((res) => {
      this.stages = res.data.data;
    });
  },
  methods: {
    eventSearch () {
      axios.post("/graphql", {
        query: `query events ($weaponName: String $stageId: Int){
          events(weaponName: $weaponName stageId: $stageId){
            id
            startAt
            endAt
            hours
            stage { name }
            eventsWeapons { weapon{ name imageUrl } }
          }
        }`,
        variables: {
          "weaponName": this.selectedWeapon,
          "stageId": this.selectedStage
        }
      }).then((res) => {
        this.events = res.data.data.events;
      });
    }
  }
});
