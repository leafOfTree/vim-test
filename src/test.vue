<template>
  <p>{{ greeting }}</p>
</template>


<script>
import MyComponent from '../components/MyComponent.vue';

export default {
  components: { MyComponent },
  data: function () {
    return {
      greeting: 'Hello'
    };
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
