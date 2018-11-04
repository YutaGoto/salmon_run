<template>
  <div>
    <div class="uk-section">
      <div class="uk-container">
        <h1 id="content" class="uk-heading-divider">すぷらとぅーん2 サーモンラン 詳細</h1>
        <dl class="uk-description-list">
          <dt>開催日時</dt>
          <dd>{{event.start_at}}〜{{event.end_at}}</dd>
          <dt>ステージ</dt>
          <dd>
            <p>{{event.stage_name}}</p>
            <img v-bind:src='event.stage_image_url' />
          </dd>
        </dl>
        <table class="uk-table uk-table-small uk-table-divider"">
          <thead>
            <tr>
              <th>ブキ1</th>
              <th>ブキ2</th>
              <th>ブキ3</th>
              <th>ブキ4</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td v-for="weapon in event.weapons">
                <p>{{weapon.name}}</p>
                <img v-bind:src='weapon.image_url' uk-img class="weapon-image" />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  export default {
    data: function() {
      return {
        event: {},
      }
    },
    mounted () {
      axios.get("/api/events/1").then((res) => {
        this.event = res.data.data;
      });
    }
  }
</script>
