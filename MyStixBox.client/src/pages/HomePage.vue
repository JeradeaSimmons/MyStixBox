<template>
<section class="backgroundImg">
  <div class="text-white p-3">
  <p>USE API TO SEARCH</p>


    <StixForm>
      <template #button>
        <button class="btn btn-light text-black" data-bs-target="#stix-form" data-bs-toggle="modal" title="New Stix">➕
          Add Stix</button>
      </template>
    </StixForm>
  </div>
  <div class="masonry">
    <StixCard v-for="s in stix" :key="s.id" :stix="s" />
  </div>
</section>
 
</template>

<script>
import { computed, onMounted } from "vue";
import { AppState } from "../AppState";
import { logger } from "../utils/Logger";
import Pop from "../utils/Pop";
import {stixService } from "../services/StixService";
import StixCard from "../components/StixCard.vue";
import StixForm from "../components/StixForm.vue";


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
    components: { StixCard, StixForm }
}
</script>

<style scoped lang="scss">
.backgroundImg{
  background-image: url(https://images.freeimages.com/images/previews/f94/cigar-1441566.jpg);
  background-position: center;
  background-size: cover;
  height: 200vh;
  
}
.masonry {
  columns: 6 200px;
  column-gap: 1rem;
  div {
    width: 150px;
    
    color: white;
    margin: 0 1rem 1rem 0;
    display: inline-block;
    width: 100%;
    text-align: center;
    font-family: system-ui;
    font-weight: 900;
    font-size: 2rem;
  } 
}
</style>
