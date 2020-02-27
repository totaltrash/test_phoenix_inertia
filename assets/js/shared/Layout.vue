<template>
  <div>
    <div class="container">
      <b-navbar>
        <template slot="brand">
          <b-navbar-item>
            <img
              src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
              alt="Lightweight UI components for Vue.js based on Bulma"
            />
          </b-navbar-item>
        </template>
        <template slot="start">
          <b-navbar-item href="/" tag="inertia-link">Home</b-navbar-item>
          <b-navbar-item href="/about" tag="inertia-link">About</b-navbar-item>
          <b-navbar-item href="/items" tag="inertia-link">For Sale</b-navbar-item>
          <b-navbar-item href="/users" tag="inertia-link">Users</b-navbar-item>
          <b-navbar-dropdown label="Info">
            <b-navbar-item href="/about" tag="inertia-link">About</b-navbar-item>
            <b-navbar-item href="/items" tag="inertia-link">For Sale</b-navbar-item>
          </b-navbar-dropdown>
        </template>

        <template slot="end">
          <b-navbar-item tag="div">
            <div class="buttons">
              <a class="button is-light" @click="logout">Log out</a>
            </div>
          </b-navbar-item>
        </template>
      </b-navbar>
    </div>
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
    },
    logout() {
      this.$inertia.delete('/logout')
    }
  }
}
</script>

<style scoped>
</style>