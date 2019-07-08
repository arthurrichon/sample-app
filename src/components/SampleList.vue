<template>
  <div class="list-container">
    <h1>{{ counterMessage }}</h1>
    <table>
      <thead>
        <tr>
          <th v-for="col in columns">{{ col }}</th>
        </tr>
      </thead>
      <tbody>
        <SampleListItem
          v-for="item in items"
          :item="item"
          :columns="columns"
          @tfSelected="manageCounter"
          ref="listItem" />
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
    count: 0,
    columns: ['from', 'to', 'pending']
  }),
  props: {
    items: {
      type: Array,
      default: function () { return [] }
    }
  },
  methods: {
    manageCounter (isSelected) {
      isSelected ? this.count++ : this.count--
    }
  },
  computed: {
    counterMessage: function () {
      return this.count > 0 ? `Mon beau compteur ${this.count}` : ''
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
