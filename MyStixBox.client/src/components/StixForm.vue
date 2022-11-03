<template>


<slot name="button">
    
  </slot>


  <Modal id="stix-form">
    
    <template #header>New Stix</template>
    <template #body>
      <form class="row p-5" @submit="handleSubmit">
        <div class="col-md-4 mb-3">
          <label for="stix-name" class="form-label">Name</label>
          <input required v-model="editable.name" type="text" class="form-control" name="stix-name" id="stix-name"
            placeholder="Name">
        </div>
        <div class="col-md-4 mb-3">
          <label for="stix-company" class="form-label">Company</label>
          <input required v-model="editable.company" type="text" class="form-control" name="stix-company" id="stix-company"
            placeholder="Company">
        </div>
        <div class="col-md-4 mb-3">
          <label for="stix-binder" class="form-label">Binder</label>
          <input required v-model="editable.binder" type="text" class="form-control" name="stix-binder" id="stix-binder"
            placeholder="Binder">
        </div>
        
        <div class="col-md-4 mb-3">
          <label for="stix-filler" class="form-label">Filler</label>
          <input required v-model="editable.filler" type="text" class="form-control" name="stix-filler" id="stix-filler"
            placeholder="Filler">
        </div>
        <div class="col-md-4 mb-3">
          <label for="stix-wrapper" class="form-label">Wrapper</label>
          <input required v-model="editable.wrapper" type="text" class="form-control" name="stix-wrapper" id="stix-wrapper"
            placeholder="Wrapper">
        </div>
        <div class="col-md-4 mb-3">
          <label for="stix-img" class="form-label">Photo</label>
          <input required v-model="editable.img" type="text" class="form-control" name="stix-img" id="stix-img"
            aria-describedby="helpId" placeholder="Photo">
        </div>
        <div class="col-12 mb-3">
          <label for="stix-review" class="form-label">Review</label>
          <textarea v-model="editable.myReview" class="form-control" name="stix-review" id="keep-review" rows="3"></textarea>
        </div>
        <div class="col-12">
          <button class="btn btn-secondary" data-bs-dismiss="modal" title="submit form">Create <i class="mdi mdi-plus"></i></button>
        </div>
      </form>
    </template>
   
  </Modal>







</template>
<script>

import { ref } from "vue";
import { stixService } from "../services/StixService";
import { logger } from "../utils/Logger";
import Pop from "../utils/Pop";



export default {
    setup() {
        const editable = ref({});
        return {
            editable,
            async handleSubmit() {
                try {
                    if (!editable.value.id) {
                        await stixService.create(editable.value);
                        Pop.success("Stix Added");
                    }
                }
                catch (error) {
                    logger.error(error);
                    Pop.toast(error.message, "error");
                }
            }
        };
    },
    
};
</script>
<style lang="scss" scoped>
</style>