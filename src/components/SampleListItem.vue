<template lang="html">
  <tr v-on:click="selectTx()" v-bind:style="{'background-color': selected ? 'lightblue': ''}">
    <td>{{ item.from }}</td>
    <td>{{ item.to }}</td>
    <td>{{ item.pending }}</td>
  </tr>
</template>

<script>
export default {
  name: 'SampleListItem',
  data: () => ({
    selected: false
  }),
  props: {
    item: {
      type: Object,
      default: function () { return {} }
    }
  },
  methods: {
    selectTx () {
      this.selected = !this.selected
    }
  }
}
</script>

<style lang="css" scoped>
table tr th, table tr td {
  padding: 5px;
}
table tbody tr:nth-child(2n+1) {
  background-color: #DDD;
}
</style>
