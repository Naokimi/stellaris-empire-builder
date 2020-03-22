<template>
  <div>
    <router-link :to="{ name: 'Government', params: { id: government.id } }">
      <p>{{ government.name }}</p>
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'Box',
  props: ['government']
}
</script>
