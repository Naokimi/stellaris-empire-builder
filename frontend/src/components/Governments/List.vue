<template>
  <div>
    <h3>Governments</h3>
    <Box v-for="government in governments" :key="government.id" :government="government"></Box>
  </div>
</template>

<script>
import Box from './Box'

export default {
  name: 'List',
  data () {
    return {
      search: '',
      governments: []
    }
  },
  created () {
    this.$http.get('/governments')
        .then(request => this.buildGovernmentList(request.data))
        .catch(() => { alert('Something went wrong!') })
  },
  methods: {
    buildGovernmentList (data) {
      this.governments = data
    },
    searchMatch (authorGovernment) {
      return authorGovernment.toLowerCase().match(this.searchRegExp)
    }
  },
  computed: {
    searchRegExp () {
      return new RegExp(`(.*)${this.search}(.*)`)
    }
  },
  components: {
    Box
  }
}
</script>
