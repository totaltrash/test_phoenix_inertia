<template>
  <div>
    <h1 class="is-1 title">Home</h1>
    <p>Welcome to the home page</p>
    <b-button @click="$inertia.post('/form_submit')">Send post</b-button>
  </div>
</template>

<script>
import AppLayout from '~/shared/Layout'

export default {
  layout: AppLayout
}
</script>
