<template>
 <section class="backgroundImg">
<div class="row d-flex justify-content-evenly" v-for="s in stix" :key="s.id">
 <div class="col-md-3">
  <StixCard :stix="s"/>
 </div>
  
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
import StixCard from "../components/StixCard.vue";


export default {
    setup() {
        async function getStix() {
            try {
                await stixService.getStix();
            }
            catch (error) {
                logger.error(error);
                Pop.toast(error.message, "error");
            }
        }
        onMounted(() => {
            getStix();
        });
        return {
            stix: computed(() => AppState.stix)
        };
    },
    components: { StixCard }
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
