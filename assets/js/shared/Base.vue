<template>
  <div>
    <div class="container"></div>
    <section class="section">
      <div class="container">
        <slot />
      </div>
    </section>
  </div>
</template>

<script>
export default {
  watch: {
    $page: {
      handler(page) {
        this.flashHandler(page)
      },
      deep: true
    }
  },
  created() {
    this.flashHandler(this.$page)
  },
  methods: {
    flashHandler(page) {
      if (page.flash) {
        for (const [type, message] of Object.entries(page.flash)) {
          this.$buefy.toast.open({
            message,
            type: 'is-' + type,
            position: 'is-bottom'
          })
        }
      }
    }
  }
}
</script>

<style scoped>
</style>