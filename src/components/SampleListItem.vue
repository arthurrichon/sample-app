<template lang="html">
  <tr v-if="!filter.length || (item.txId.toLowerCase().includes(filter.toLowerCase()) || item.from.toLowerCase().includes(filter.toLowerCase()))" v-on:click="selectTx()" v-bind:style="{'background-color': selected ? 'lightblue': ''}">
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
    },
    filter: {
      type: String,
      default: ''
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
