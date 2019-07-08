<template lang="html">
  <tr
    :style="{'background-color': selected ? 'lightblue': ''}"
    @click="emitClickEvent()">
    <td v-for="column in columns">{{ item[column] }}</td>
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
    columns: {
      type: Array,
      default: function () { return [] }
    }
  },
  methods: {
    emitClickEvent () {
      this.selected = !this.selected
      this.$emit('tfSelected', this.selected)
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
<!-- <tr v-on:click="selectTx()" v-bind:style="{'background-color': selected ? 'lightblue': ''}">
  <td>{{ item.from }}</td>
  <td>{{ item.to }}</td>
  <td>{{ item.pending }}</td>
</tr> -->
