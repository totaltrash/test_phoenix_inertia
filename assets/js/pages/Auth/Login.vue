<template>
  <section class="section is-medium">
    <div class="columns is-mobile is-centered">
      <div class="column is-5-tablet is-4-desktop is-3-widescreen">
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
              <!-- Label left empty for spacing -->
              <p class="control">
                <button class="button is-primary" @click.prevent="submit">Login</button>
              </p>
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