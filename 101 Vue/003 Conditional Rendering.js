// ------------------------- CONDITIONAL RENDERING ------------------------- //
// Simple show/hide
<div id="app">
  <p v-if="mode == 1"> Showing v-if directive content </p>
  <p v-else-if="mode == 2">v-else-if</p>
  <p v-else>v-else</p>
</div>

data() {
  return{
    mode: 1
  }  
}


// Show hide with select
<p v-if="mode == 1"> Showing v-if directive content </p>
<p v-else-if="mode == 2">v-else-if</p>
<p v-else>v-else</p>

<select v-model="mode">
  <option value="1">v-if</option>
  <option value="2">v-else-if</option>
  <option value="3">v-else</option>
</select>

// Use template vue tag for wrapping multiple elements in a condition
    <p v-if="mode == 1"> Showing v-if directive content </p>
    <template v-else-if="mode == 2">
      <p>Bonus content</p>
      <h3>v-else-if</h3>
    </template>
    <p v-else>v-else</p>

// Default Vue show directive
// This option uses the display css properties while the previous will comment out to hide the html portion
<i v-show="mode == 1">v-show</i>
