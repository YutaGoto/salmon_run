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
    }
  },
  mounted () {
    axios.get('/api/events/open').then(res => {
      this.isOpen = res.data.data.is_open
      if (this.isOpen) {
        this.opening_event = res.data.data.event
      }
    });

    axios.get('/api/events').then(res => {
      this.events = res.data.data;
    });
  }
});

Vue.component('select2', {
  props: ['options', 'value'],
  template: '#weapon-select-template',
  mounted: function () {
    var weaponVm = this
    $(this.$el)
      // init select2
      .select2({ data: this.options })
      .val(this.value)
      .trigger('change')
      // emit event on change.
      .on('change', function () {
        weaponVm.$emit('input', this.value)
      })
  },
  watch: {
    value: function (value) {
      // update value
      $(this.$el).val(value).trigger('change')
    },
    options: function (options) {
      // update options
      $(this.$el).empty().select2({ data: options })
    }
  },
  destroyed: function () {
    $(this.$el).off().select2('destroy')
  }
})

var weaponVm = new Vue({
  el: '#elw',
  template: '#weapon-template',
  data: {
    selected: 2,
    options: []
  },
  mounted () {
    axios.get('/api/weapons').then(res => {
      this.options = res.data.data
    });

  }
})

Vue.component('select2', {
  props: ['options', 'value'],
  template: '#stage-select-template',
  mounted: function () {
    var stageVm = this
    $(this.$el)
      // init select2
      .select2({ data: this.options })
      .val(this.value)
      .trigger('change')
      // emit event on change.
      .on('change', function () {
        stageVm.$emit('input', this.value)
      })
  },
  watch: {
    value: function (value) {
      // update value
      $(this.$el).val(value).trigger('change')
    },
    options: function (options) {
      // update options
      $(this.$el).empty().select2({ data: options })
    }
  },
  destroyed: function () {
    $(this.$el).off().select2('destroy')
  }
})

var stageVm = new Vue({
  el: '#els',
  template: '#stage-template',
  data: {
    selected: 2,
    options: []
  },
  mounted () {
    axios.get('/api/stages').then(res => {
      this.options = res.data.data
    });

  }
})
