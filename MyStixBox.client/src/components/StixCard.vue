<template>

<div class="card m-3 rounded elevate">
  <img class="img-fluid" :src="stix.img" alt="">
  <h3>{{stix.company}}</h3>
  <h5>{{stix.name}}</h5>
</div>


</template>
<script>
import { objectToString } from "@vue/shared";

export default {
  props:{
    stix:{
      type: Object,
      required: true
    }
  },
setup(props) {
  return {};
},
};
</script>
<style lang="scss" scoped>
</style>