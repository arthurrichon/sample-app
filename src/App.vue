<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">

    <SampleList :items="items"/>
  </div>
</template>

<script>
import SampleList from './components/SampleList.vue'

export default {
  name: 'app',
  data: () => ({
    user: {},
    items: []
  }),
  components: {
    SampleList
  },
  mounted () {
    this.login()
  },
  methods: {
    async login () {
      let user = new this.$ownest.User('demo@ownest.io')
      let success = await user.auth('Demo1234')
      if (success) this.user = user
      this.getUserHistory()
    },
    async getUserHistory () {
      await this.user.wallet.getStocks()
      let history = await this.user.wallet.getHistory()
      history = history.history
      let allTfs = history || []

      let myHistory = allTfs.filter((tf) => (tf.from !== this.user.wallet.address)).sort((a, b) => {
        if (a.phase === 'send' && a.state === 'ok') return -1
        else if (!a.accepted && a.pending && !a.done) return -1
        return ((a.sentDate <= b.sentDate) ? 1 : -1)
      })

      myHistory = myHistory.concat(allTfs.filter((tf) => (tf.from === this.user.wallet.address)).sort((a, b) => ((a.sentDate < b.sentDate) ? 1 : -1)))

      this.items = myHistory
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
