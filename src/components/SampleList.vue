<template>
  <div class="list-container">
    <button type="button" name="button" v-on:click="checkSelectedTxs()">Check selected txs</button>
    <table>
      <thead>
        <tr>
          <th>From</th>
          <th>To</th>
          <th>Pending</th>
        </tr>
      </thead>
      <tbody>
        <SampleListItem v-for="item in items" :item="item" ref="listItem"/>
      </tbody>
    </table>
  </div>
</template>

<script>
import SampleListItem from './SampleListItem'
export default {
  name: 'SampleList',
  components: { SampleListItem },
  data: () => ({
    selectedTxs: []
  }),
  props: {
    items: {
      type: Array,
      default: function () { return [] }
    }
  },
  methods: {
    checkSelectedTxs () {
      this.selectedTxs = []
      for (var i = 0; i < this.$refs.listItem.length; i++) {
        if (this.$refs.listItem[i].selected) {
          this.selectedTxs.push(this.$refs.listItem[i].$props.item)
        }
      }
      console.log(this.selectedTxs)
    }
  }
}
</script>

<style lang="css" scoped>
  table {
    border-collapse: collapse;
    width: 90%;
    margin: 0 auto;
  }


</style>
