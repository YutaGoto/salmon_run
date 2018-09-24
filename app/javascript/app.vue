<template>
  <tr v-for="salmon_event in salmon_events">
    <td>{{ salmon_event.id }}</td>
    <td>{{ salmon_event.start_at }}</td>
    <td>{{ salmon_event.end_at }}</td>
    <td>{{ salmon_event.stage.name }}</td>
    <td v-for="weapon in salmon_event.weapons">
      {{weapon.name}}
    </td>
  </tr>
</template>

<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
