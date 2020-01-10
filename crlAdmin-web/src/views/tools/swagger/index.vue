<template>
  <!--<elFrame :src="swaggerApi"/>-->
  <vue-friendly-iframe :src="swaggerApi" :frameborder="frameborder" :class-name="className" :allowfullscreen="allowfullscreen" style="width: 100%;height: 100%" @load="onLoad" @document-load="onDocumentLoad" />
</template>
<script>
import { mapGetters } from 'vuex'
import VueFriendlyIframe from 'vue-friendly-iframe'
import elFrame from '@/components/iframe/index'
export default {
  components: { VueFriendlyIframe, elFrame },
  data() {
    return {
      allowfullscreen: 'allowfullscreen',
      frameborder: '0',
      className: 'my-iframe'
    }
  },
  computed: {
    ...mapGetters([
      'swaggerApi'
    ])
  },
  methods: {
    onLoad() {
      console.log('load start!')
    },
    onDocumentLoad() {
      console.log('load end!')
    }
  }

}
</script>
<style scoped>
.my-frame{
  width: 100%;height: 100%
}
</style>
