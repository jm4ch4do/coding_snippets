// Ini application and mounted to the id=app
// save app in vm variable (View Model)
const vm = Vue.createApp({
  data(){
      return {
          firstName: 'John',
          middleName: '',
          lastName: 'Doe',
          url: 'https://www.google.com',
          raw_url: '<a href="https://www.google.com" target="_blank">Google</a>',
          age: 20
      }
  },

  methods: {

    increment(){
      this.age++
    },

    updateLastName(msg, event){
      event.preventDefault()
      console.log(msg)
      this.lastName = event.target.value
    },

    updateMiddleName(event){
        this.middleName = event.target.value
      },


  },

  computed: {
    fullName(){
        //return `${this.firstName} ${this.lastName.toUpperCase()}`
        let fullName = this.firstName.concat(" ",this.middleName, " ", this.lastName)
        return fullName
      },
  },

  watch: {
      age(newVal, oldVal){
        setTimeout(() => {
            this.age = 20
        }, 3000)
      }
  }

}).mount('#app')

// setTimeout(() => {
//   vm.firstName = 'Bob'

// }, 2000)

// Vue.createApp({
//     data(){
//         return {
//             firstName: 'John2',
//             lastName: 'Doe2'
//         }
//     }
//   }).mount('#app2')