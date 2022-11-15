"------------------------COMPONENTS-------------------------"
// Component are Javascript functions that return JSX (very similar to HTML)
// JSX = JavaScript eXtenstion
// Babel translates JSX into plain Javascript
// Then the React DOM generates the HTML for the browser

// --- Simple Banner component (funciton components)
const Banner = () => <h1>This is a banner</h1>;

// --- Greeting component which includes Banner
// In this case div is a built-in component.
// Built-in components are camelCased and 
// custom components are PascalCased
const Greeting = () => (
    <div>
        <Banner />
        <h2 className="highlight">Greetings!</h2>
    </div>
);

// the className atribute is equivalent to the class in HTML

// --- Alternative Way of Writing a Component (class components)
class Greeting extends React.Component{
    render(){
        return(
            <div>
                <Header/>
                <h2 className="highlight">Hi there!</h2>
            </div>
        )
    }
}



"------------------------MODULES-------------------------"
// --- export and import from modules
// module.js
const doSomething = () => {
    ...
}
export {doSomething};
    
//anotherModule.js
import{ doSomething} from "./module"; 
doSomething();

// --- export as default
// banner.js
const Banner = () => (
<h1> This is a banner </h1>
);
export default Banner;
    
//greetings.js
Import Banner from "./banner";
    
const Greeting = () => (
    <Banner />
);

