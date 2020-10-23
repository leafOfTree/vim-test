<div>
  <p>{greeting}</p>
</div>

<div 
  class="foobar {className}">
  <slot />
</div>

<div 
  a="1"
  b="2"
/>

<div 
  a="1"
  b="2" />

<template lang="pug">
// Highlight everything in here as Pug.
main
  h1 
    Balance
+await('getBalances')
  Spinner
+then
  Leader
  History
</template>

<script>
  let greeting = 'Hello';
</script>

<script lang="coffee">
  # Assignment:
  number = 42
  opposite = true

  # Conditions:
  number = -42 if opposite

  # Functions:
  square = (x) -> x * x

  # Arrays:
  list = [1, 2, 3, 4, 5]

  # Objects:
  math =
    root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

  # Splats:
  race = (winner, runners...) ->
  print winner, runners

  # Existence:
  alert "I knew it!" if elvis?

  # Array comprehensions:
  cubes = (math.cube num for num in list)

</script>

<style>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>

<style scoped lang="scss">
  $a: 100px;

  div {
    background: white;
  }
</style>

<style lang="sass">
  $w: 128px;

  .bg
  $w: 128px;
    background: white;
  align-items: center;

  canvas
    width: 100vw;
</style>

<style lang="less">
  @list: 10 12;
  canvas {
    background: white;
    width: 100vh;
  }
</style>
