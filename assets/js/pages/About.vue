<template>
  <div>
    <h1 class="is-1 title">About Us</h1>
    <p>Here's some info about us</p>
    <b-button @click="addToast" type="is-primary">Add toast</b-button>
  </div>
</template>

<script>
import AppLayout from '~/shared/Layout'

export default {
  layout: AppLayout,
  methods: {
    addToast() {
      this.$buefy.toast.open({
        message: 'New toast',
        position: 'is-bottom'
        //duration: 100000
      })
    }
  }
}
</script>
