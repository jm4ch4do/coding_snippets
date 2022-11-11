// ------------------------------ BASICS ------------------------------ //
// 1. Install Node
// 2. Test if node is installed on cmd: node -v
// 3. Test: npm -v
// 4. Install chrome extension: Vue DevTools
// 5. Install visual studio code extension: Vetur

// Alternatively, you may use the CDN
<body>
  <div id="app">
  <p>Hey</p>
  </div>
  <script src="https://unpkg.com/vue@next"></script>
  <script src="app.js"></script>
</body>
  
// Ini application and mounted to the id=app
Vue.createApp({}).mount('#app')


// ------------------------------ BASICS ------------------------------ //
// propeties
  data(){
      return {
          firstName: 'John',
          lastName: 'Doe'
      }
  },

// methods
  methods: {
    fullName(){
        //return `${this.firstName} ${this.lastName.toUpperCase()}`
        this.fullName = this.firstName.concat(" ", this.lastName)
        return this.fullName
    }
  }

// directives (v-cloak)
    <div id="app" v-cloak>
      {{ fullName() }}
    </div>

// Two-way data binding
// View and model are binded, if you change one the other will also change


// Binding Attributes
// HTML attributes can be binded to Vue variables
// instead of this
<a href="https://www.google.com">
// use this
<a v-bind:href="url">
// then set the attribute from Vue app
  data(){
      return {
          url: 'https://www.google.com'
      }
  },

// Raw HTML directive
<p v-html>"raw_url"</p>
  data(){
      return {
          raw_url: '<a href="https://www.google.com" target="_blank">Google</a>'
      }
  },
      
// Listening to Events
// yout can listen to events really easy by using directives
<label>Last Name</label>
<input type="text" :value="lastName" @input="updateLastName"/>

<button type="button" v-on:click="increment">Increment</button>
<button type="button" @click="age--">Decrement</button>

increment(){
  this.age++
},

updateLastName(event){
  this.lastName = event.target.value
}


// Passing Data to Events
<input type="text" :value="lastName" @input="updateLastName('Last name event triggered', $event)"/>

updateLastName(msg, event){
  event.preventDefault()
  console.log(msg)
  this.lastName = event.target.value
}

// Event Modifiers (example for preventDefaultBehavior)
<input type="text" :value="lastName" @input.prevent="updateLastName('Last name event triggered', $event)"/>
updateLastName(msg, event){
  console.log(msg)
  this.lastName = event.target.value
}

// Example, update value on hitting enter
<label>Middle Name</label>
<input type="text" @keyup.enter="updateMiddleName"/>
    
updateMiddleName(event){
  this.middleName = event.target.value
},

// Example: lazy and trim
// trim removes extra white-space and lazy waits for the user exit the element or press enter to update the value
<label>First Name</label>
<input type="text" v-model.lazy.trim="firstName"/>
    
// Example: Handling numbers
<label>Age</label>
<input type="number" v-model.number="age"/>
    
// Computed properties
// Methods are constantly being recalculated adding extra overload to the page
// That's why is best to use computed properties
// Is very similar to Text with autoenter in Filemaker
// The value will only be recalculated if any of the members of the equation changed
<p>{{ fullName }}</p>

computed: {
  fullName(){
  //return `${this.firstName} ${this.lastName.toUpperCase()}`
  let fullName = this.firstName.concat(" ",this.middleName, " ", this.lastName)
    return fullName
  },

// Watchers enable custom data manipulation
// Example, data returns to previous value after 3 seconds
watch: {
  age(newVal, oldVal){
    setTimeout(() => {
      this.age = 20
    }, 3000)
  }
}


