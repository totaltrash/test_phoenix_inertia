<template>
  <div>
    <p>List</p>
    <pre>
      {{ list }}
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
