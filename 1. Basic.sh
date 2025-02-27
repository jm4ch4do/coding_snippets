CONCEPTS
# What is?
# Angular is the final version (Angular JS is the old one).
# Angular is based on components for reusability.
# Angular is a framework, React is a library.
# Angular is written in TypeScript.

Angular Features
# Template, Data Binding, Forms, Routing, Observables, PWA(Native Apps)

TypeScript
# Strongly Typed Programming Language (Enforces Types)
# Superset of JS, typescript is compliled to JS

Install
# Download and install node first
npm init  // inits package
npm install -g typescript // installs typescript
tsc --init  // creates the compiler options file
tsc // compliles typescript files

SPA Single Page Applications
# Angular has Routing to create SPA
# Also offers SSR(Server Side Rendering) which also supports SPA

Data Types in Typescript
# It has type inference, but is recommended to clearly define the type.
# available types: string, number(int+float), boolean, array(list), Enum, tuple, any, void(None), never

Install Angular
npm i @angular/cli -g
ng --version
ng new hotelinventoryapp # create new workspace and project

Angular CLI Commands
ng build  # compile code and output files into a build directory
ng serve -o  # start local server
ng serve # compile code, launch a dev server, and watch for file changes.
ng generate  # add new files using Angular's built-in boilerplates
ng lint and ng test  # lint and unit testing tools