<template>
  <header>
    <Navbar />
  </header>
  <main class="container-fluid">
    <router-view />
  </main>
  <footer>
    <div class="bg-grey text-black text-center p-4">
      <h4 class="myText">A Good Cigar is The One You Are Currently Smoking!</h4>
    </div>
  </footer>
</template>

<script>
import { computed } from 'vue';
import { AppState } from './AppState';

export default {
  name: 'App',
  setup() {
    return {
      appState: computed(() => AppState)
    }
  }
}
</script>
<style lang="scss">
@import "./assets/scss/main.scss";



.myText {
  font-family: monospace;
  font-size: larger;
}
</style>
