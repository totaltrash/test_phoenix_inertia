<template>
  <div>
    <h1 class="is-1 title">Users</h1>
    <b-table :columns="columns" :data="users"></b-table>
  </div>
</template>

<script>
import AppLayout from '~/shared/Layout'

export default {
  layout: AppLayout,
  props: {
    users: {
      required: true,
      type: Array
    }
  },
  data() {
    return {
      columns: [{ label: 'Email', field: 'email', sortable: true }]
    }
  }
}
</script>
