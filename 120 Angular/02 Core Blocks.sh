CORE BUILDING BLOCKS

DECORATORS: 
# Decorators are functions that return functions.
Common decorators are:
	@NgModule()  to define modules
	@Component() for components
	@Injectable() for services
	@Pipe()
	@Directive()
	@Input() for data flowing into a component
	@Output() for data flowing out of a component
	
MODULES
# Collection of files that work together. Might include components.

COMPONENTS
# Main building blocks of all Angular applications. They have 4 parts:
	HTML Templates: Defines the UI for the component
	CSS Styles: Will be applied to the template
	TypeScript class: Controls the components behavior
	Component selector: Tells Angular where to put the component in the DOM
	
EXAMPLE_OF_COMPONENT

@Component({  # Example of component decorator:
	Selector: 'app-players',
	templateUrl: './players.component.html',
	styleUrls: ['./players.component.css']
})
Export class PlayersComponent implements OnInit {  // Examples of component class:
	Public players$: Observable<Player[] | undefined> = of(undefined);
	
	Constructor(
		Private api: ApiService
	){}
	
	Public ngOnInit(): void {
		this.players$ = this.api.getAllPlayers$();
		
	Public update(text: string) {
		this.players$ = this.api.getPlayersByName$(text);

NEW COMMAND
ng generate component listings-page  # creates new component
ng generate service service-name # generates new service