<template>
  <div>
    <h1>Home</h1>
    <p>Welcome to the home page</p>
    <i-button @click="$inertia.post('/form_submit')">Send post</i-button>
  </div>
</template>

<script>
import AppLayout from '~/shared/Layout'

export default {
  layout: AppLayout
}
</script>
