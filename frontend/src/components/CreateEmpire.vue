<template>
  <div>
    <p>I want to display all governments</p>
    <ul v-if="governments" v-for="government in governments" :key="government.id">
      <li>{{ government.authority }}</li>
    </ul>
  </div>
</template>

<script>
  import gql from 'graphql-tag'

  export default {
    data: {
      governments: []
    },
    apollo: {
      governments: gql`query {
        governments {
          authority
        }
      }`,
      update: data => {
        console.log(data)
        return data
      }
    },
  }
</script>
