<template>
  <div>
    <h1 class="is-1 title">Home</h1>
    <p>Welcome to the home page</p>
    <b-button @click="sendPost">Send post</b-button>
    <b-button @click="sendPostBadVersion">Send post with different inertia version</b-button>
  </div>
</template>

<script>
import AppLayout from '~/shared/Layout'

export default {
  layout: AppLayout,
  methods: {
    sendPost() {
      this.$inertia.post('/form_submit')
    },
    sendPostBadVersion() {
      this.$inertia.version = '123'
      this.$inertia.post('/form_submit')
    }
  }
}
</script>
