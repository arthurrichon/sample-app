import Vue from 'vue'
import App from './App.vue'
import * as Ownest from 'ownest'

Vue.config.productionTip = false

Ownest.Api.setUrl('staging')
Vue.prototype.$ownest = Ownest

new Vue({
  render: h => h(App),
}).$mount('#app')
