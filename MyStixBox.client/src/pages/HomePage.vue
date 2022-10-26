<template>
 <section class="backgroundImg">
<div class="row">
  
</div>
 </section>
 
</template>

<script>
import { computed } from "@vue/reactivity";
import { onMounted } from "vue";
import { AppState } from "../AppState";
import { logger } from "../utils/Logger";
import Pop from "../utils/Pop";
import {stixService } from "../services/StixService";


export default {
  
  setup(){
async function getStix(){
    try {
      await stixService.getStix();
    } catch (error) {
      logger.error(error)
      Pop.toast(error.message, 'error')
    }
  }


onMounted(()=>{
  getStix();
})
return{
stix: computed(()=> AppState.stix)
}
  }
}
</script>

<style scoped lang="scss">
.backgroundImg{
  background-image: url(https://images.freeimages.com/images/previews/f94/cigar-1441566.jpg);
  background-position: center;
  background-size: cover;
  height: 100vh;
  
}
</style>
