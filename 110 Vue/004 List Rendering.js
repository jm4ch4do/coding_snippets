// ------------------------- List Rendering ------------------------- //

//Displaying a list having a distint content and className for each item
<ul>
  <li v-for="bird in birds" :class="bird">
    {{ bird}}
  </li>
</ul>

data() {
  return {
    birds: ['Pigeons', 'Eagles', 'Doves', 'Parrots'],
    people: [
      { name: 'John', age: 20 },
      { name: 'Rick', age: 18 },
      { name: 'Amy', age: 33 }
    ]
  }
}

// Also displaying the index
<ul>
  <li v-for="(bird, index) in birds" :class="bird">
    {{ bird}} - {{ index }}
  </li>
</ul>

// Displaying list of objects
<ul>
  <li v-for="person in people">
  <div>{{ person.age }} </div>
  <div>{{ person.name }} </div>
</ul>

// Display value key pairs
    <ul>
      <li v-for="(value, key, index) in people">
        {{ key }}: {{ value }} - Index: {{ index }}
    </ul>
