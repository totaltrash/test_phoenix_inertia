<template>
  <div>
    <h1>Users</h1>
    <i-datatable :columns="columns" defaultSortKey="username" :rows="users" :countColumn="false" :pagination="false"></i-datatable>
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
      columns: [
        { title: 'Username', path: 'username', sortable: true },
        { title: 'Display Name', path: 'display_name', sortable: true },
        { title: 'Email', path: 'email', sortable: true }
      ]
    }
  }
}
</script>
