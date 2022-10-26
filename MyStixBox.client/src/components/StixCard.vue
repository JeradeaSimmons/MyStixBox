<template>

<div class="rounded elevation-3 d-flex align-items-end bg-dark mainImg">
  <img class="img-fluid" height="" :src="stix.img" alt="">
<div class="nameImg text-dark card">
  <h3>{{stix.company}}</h3>
  <h5>{{stix.name}}</h5>
  </div>
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

.mainImg{
  position: relative;
}

.nameImg{
  position: absolute;
}

</style>