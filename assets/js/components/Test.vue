<template>
    <p>{{ message }}</p>
</template>

<script>
export default {
  data() {
    return {
      message: 'Hello from Vue!'
    }
  },
  created() {
    console.log('Vue component created')
  }
}
</script>
