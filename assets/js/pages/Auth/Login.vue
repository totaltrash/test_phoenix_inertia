<template>
  <section class="section is-medium">
    <div class="columns is-mobile is-centered is-variable is-0">
      <div class="column is-6-tablet is-5-desktop is-4-widescreen">
        <div class="bd-notification is-primary">
          <h1 class="title">My Application</h1>
          <h2 class="subtitle">Login</h2>
          <form>
            <b-field label="Username">
              <b-input v-model="form.email"></b-input>
            </b-field>
            <b-field label="Password">
              <b-input type="password" v-model="form.password"></b-input>
            </b-field>
            <b-field>
              <button class="button is-primary" @click.prevent="submit">Login</button>
            </b-field>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import BaseLayout from '~/shared/Base'

export default {
  layout: BaseLayout,
  data() {
    return {
      form: {
        email: '',
        password: ''
      }
    }
  },
  methods: {
    addToast() {
      this.$buefy.toast.open({
        message: 'New toast',
        position: 'is-bottom'
        //duration: 100000
      })
    },
    submit() {
      this.$inertia.post('/login', this.form)
    }
  }
}
</script>

<style scoped>
.label {
  width: 400px;
}
</style>