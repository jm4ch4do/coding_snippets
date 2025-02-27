// ------------------------------ BINDING CLASSES ------------------------------ //
// You may change element colors and other properties by binding classes
// An example just toggling a single color from the data
  <div id="app">
    <label>
      <input type="checkbox" v-model="isPurple" /> Purple
    </label>

    <div class="circle" :class="{ purple: isPurple}">
      Hi!
    </div>
  </div>

  data() {
    return {
      isPurple: false
    }
  },


// another example changing text color with several choices
<select v-model="selectedColor">
  <option value="">White</option>
  <option value="text-black">Black</option>
  <option value="text-orange">Orange</option>
</select>

<div class="circle" :class="selectedColor">
  Hi!
</div>

let vm = Vue.createApp({

  data() {
    return {
      selectedColor: ''
    }
  },

  computed:{
      circle_classes(){
          return {purple: this.isPurple}
      }
  }

// Use this to get both examples working at the same time
<div class="circle" :class="[selectedColor, circle_classes]">
    

// ------------------------------ BINDING STYLES ------------------------------ //
// Example, add width, height, line-height and rotate
<div class="circle" :class="[circle_classes, selectedColor]" 
  :style="[
    { width: size + 'px', height: size + 'px', lineHeight: size + 'px'},
    { transform: 'rotate(30deg)'}
  ]">
  Hi!
</div>
                       
data() {
  return {
    size: 150
  }
},
