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
          <b-navbar-item href="/" @click.prevent="$inertia.visit('/')">Home</b-navbar-item>
          <b-navbar-item href="/about" @click.prevent="$inertia.visit('/about')">About</b-navbar-item>
          <b-navbar-item href="/items" @click.prevent="$inertia.visit('/items')">For Sale</b-navbar-item>
          <b-navbar-item href="/users" @click.prevent="$inertia.visit('/users')">Users</b-navbar-item>
          <b-navbar-dropdown label="Info">
            <b-navbar-item href="/about" @click.prevent="$inertia.visit('/about')">About</b-navbar-item>
            <b-navbar-item href="/items" @click.prevent="$inertia.visit('/items')">For Sale</b-navbar-item>
          </b-navbar-dropdown>
        </template>

        <template slot="end">
          <b-navbar-item tag="div">
            <div class="buttons">
              <a class="button is-primary">
                <strong>Sign up</strong>
              </a>
              <a class="button is-light">Log in</a>
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
export default {}
</script>

<style scoped>
</style>