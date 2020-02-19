<template>
  <i-container>
    <i-row>
      <i-column>
        <i-layout>
          <i-layout-content>
            <i-navbar>
              <i-navbar-brand>Phoenix - Inertia</i-navbar-brand>
              <i-navbar-items>
                <i-nav>
                  <i-nav-item>
                    <inertia-link class="item" href="/">Home</inertia-link>
                  </i-nav-item>
                  <i-nav-item>
                    <inertia-link class="item" href="/about">About</inertia-link>
                  </i-nav-item>
                  <i-nav-item>
                    <inertia-link class="item" href="/items">For Sale</inertia-link>
                  </i-nav-item>
                  <i-nav-item>
                    <inertia-link class="item" href="/users">Users</inertia-link>
                  </i-nav-item>

                  <!--
                  <i-nav-item href="/">Home</i-nav-item>
                  <i-nav-item href="/">About</i-nav-item>
                  <i-nav-item href="/">For Sale</i-nav-item>
                  <i-nav-item href="/">Users</i-nav-item>

                  <inertia-link href="/about">
                    <i-nav-item>About</i-nav-item>
                  </inertia-link>
                  <inertia-link href="/items">
                    <i-nav-item>For Sale</i-nav-item>
                  </inertia-link>
                  <inertia-link href="/users">
                    <i-nav-item>Users</i-nav-item>
                  </inertia-link>
                  -->
                </i-nav>
              </i-navbar-items>
            </i-navbar>
            <!--
            <inertia-link href="/">Home</inertia-link>&nbsp;|
            <inertia-link href="/about">About Us</inertia-link>&nbsp;|
            <inertia-link href="/items">For Sale</inertia-link>&nbsp;|
            <inertia-link href="/users">User List</inertia-link>
            -->
            <slot />
          </i-layout-content>
        </i-layout>
      </i-column>
    </i-row>
  </i-container>
</template>

<script>
export default {}
</script>

<style scoped>
.item:hover,
.item:focus,
.item:active {
  text-decoration: none;
}
</style>