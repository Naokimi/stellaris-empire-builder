<template>
  <div>
    <p>I want to display all governments</p>
    <ul>
      <li v-for="g in governments" :key="g.id">{{ g.name }}</li>
    </ul>
  </div>
</template>

<script>
  // import GovernmentsList from './Governments/List'

  export default {
    async beforeMount() {
      const response = await this.getGovernments();
      this.governments = response.data.governments;
    }
  }
</script>
