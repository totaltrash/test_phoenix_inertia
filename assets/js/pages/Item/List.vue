<template>
  <div>
    <h1 class="is-1 title">For Sale</h1>
    <pre>{{ items }}</pre>
  </div>
</template>

<script>
import AppLayout from '~/shared/Layout'

export default {
  layout: AppLayout,
  props: {
    items: {
      required: true,
      type: Array
    }
  }
}
</script>
