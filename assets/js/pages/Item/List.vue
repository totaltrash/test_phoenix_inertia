<template>
  <div>
    <p>List</p>
    <pre>
      {{ items }}
    </pre>
  </div>
</template>

<script>
// import Layout from '~/shared/Layout'

export default {
  props: {
    items: {
      required: true,
      type: Array
    }
  }
}
</script>
