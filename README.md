# The Intention is to Update my CoreData Shim #

### Part 7 ###
Tests and comments _do_ have a positive effect on code health.
Ok it is _not_ a big suprise that the test numbers did not pivot at all, no percent. That is good, because In the XCDModeler, I really am not writing code. I used to not trust it. Even up until

### Part 6 ###
There is that old computer science saying that any code problem can be solved with another layer of abstraction. I am not sure if this is a good or a bad thing, but I did need another layer _down_ not _up_. 

Really Simple. I know that I can get any object into and out of core data, I will likely want to do a test to see what subs are there after awakeFromInsert() or whatnot. I will also want to take a look into the relationships values back to the owner 
So where root would seem to be the base class its just a subclass of Abstract, and abstract has Sizes, Location, and Graphics. And locations should likely be Plural (let me fix that)
Root is essentially empty for now _but_ it is the parent class of KDVPerson So architechturally I have a lot of "wiggle Room" if I need it.
_The actual factual upside of this is that I could just as well went from "Event":Entity to "KDVPerson":Entity in one step!_
(For clarity and Git's sake it really is better to nibble off these commits in small chunks.)

### Part 5 ###
Back to work for a moment I do need to have something better than the project template "Event" or the AbstractControllers even worse version of raw NSManagedObject. Factually speaking this is simply not ready to put into an independent project - even if it has few if any dependencies. Look I just killed one now. 
So I have to make a Entity in the modeler
As I have already have a KDVRootEntity I decided to add KDVAbstractEntity and put incepDate up in there. Then I basically manually refactored it. {I will almost ignore the new bugs in Xcode, like it crashes if I try to delete the "Event" entity} other than that it was a pretty uneventful build. I mean all I am doing is the same as the boilerplate was doing, but with my object tree. And as this branch is InitialRootEntityState this merits a commit
_All this and more goes into test!_
 
### Part 4 ###
Ok As a sense of perspective; I could and may take the previous AbsDataController and make that last ivar test-safe. this would bring my _coverage%_ pretty high. This is amazing because If I had gone any of the Ares/tricorder/lander versions of this I would be much further along and had about zero percent tests. AAMOF let me show you
• First make a GUI
	• Just Use the Project one. At this point if it goes wrong it is dispoable this is possibly my best reason for writing this as a library is that I have written this code so many ways over and over again.
  • this is not as applicable b\c I am shooting for library
• Next Bring in Abstract and Application  DataControllers
  • Make a Root Entity and replace the one from the AppDeli -> MasterView
		• But would not be the correct pattern, b\c  of the base arrogance of "don't need to test yet"
		• Testing after the first crash is stupid
		• 
	• Fill Up the DataModel and swap the "Event" entity for my KVRootEntity()
		 • Also change the Event.Date in the KVRootEntity.incepDate
		 • Add a bunch of other Classes and child-entities
• Then, Maybe? ¿add test?.
NOPE
This is quite wrong. I have done this and my next question if I could go back to me old self; I would say "What are you trying to accomplish?". Because If I want code that I will keep trust and use properly I will get that from unitTests. The best case is that it would take me at least a month to get that hairball under test. And I have gotten here in about 6 calendar days. It is not necesarily easy or dificult. It does require a commitment. Tests and comments _do_ have a positive effect on code health.
(Back to work for a moment )
As I have already
		

### Part 3 ###

_This is kinda where it gets tricky__
(*I have been bangin on 38% - 40% code coverage*) When I drill into the tests, I see that my initializers are not 100% closer to 0 _aamof_, and when I look at the code path - - the old school init() makes a lot of sense to me - but it performs worse, in a measurable metric that matters to me than the modern one

And Since I cannot {ReadOnly} set the CoreData ivars then I have to make these
Initializers stepwise
_Unfortunately_ I cannot use one of my favorite constructs

init() {
 if (!(self = [self initWithModelClass:(@"NSManagedObject") dbName:(@"LanderX") appName:(@"LanderX")])) { return nil }
 // set ivars
 return(self);
}

Not because of the non-mutable CD DataTypes - - _Rather_ due to that old and lovely form of initializer leaves too many paths open

See with these non mutable data types I can set a getter or get fancy and set a lazy getter and never really have to worry about it but getting 20 - 30% on an init is a reason to change it

_And then things got weird_
I mean I was never really that concerned with my init()'s well maybe but that was a long time ago. 
### _¡Code Coverage is above 80% in the AbstractClass!_ ###
I mean there are things in here that are never going to pass tests. AND will work for millions of iterations. but while they are _not fragile_ today, they can be in the future. {stock trading example - - accidentally activated dead code}
I deleted the save function, as it is in an abstract class. Plus the save() wrapper is hard to test because it does not return a damn thing, I will have to wrap it up with a saveState. And I set the init() to be booby trapped with nil values for the ivars, and a proper init tree. This will matter a lot in the subclasses.


### Part 2 ###
Well as a process it was less than optimal, but the fundamentals are here. getting to tests is fun but getting to _falsifallible_ tests and correcting them is better.

I do know that there is a hella good benefit of doing it in C, If at the very least I am closer to the *error and _not_ the interpreter. 
1. Added test documentation 
		• I have thrown away a lot of Code
		• I can _add it back_ just as trivially
2. Stubbed the empty arrays in the abstractCon
Now I understand that and Asymtotic Test Rate of @100% +/- 5 is nonsense. But because these are in a test branch, well _¿wtf?_ Why Not try to get to 50% or 75% and call the rest a wash. I mean in my heart of hearts I want to get to the next 2 subclasses &KDVApplicationData + &KDVRootEntityData. I know that the concrete Load/Save Object (LSO) should be good. But those are more testable. One of the toots pointed to a *lib - - Thus killing my boner for it,

## Documenting the Newer Cocoa Process ##
	• Setup the Arch
		- unlike swift Cocoa will punish you for ambiguity
			- like recursive init failures
	• get the files in logical groups and places
		- Don't fight Xcode {you will lose (just redo the project)}
	• setup tests
		- it is _far better_ to have tests that you think you don't need than bugs you didn't know you didn't need
			- see the brains v. uuid {I thought I could recursively iterate through a 32bit field, let the lib do the heavy lifting}
	• test each class as it is introduced.
		- this way my tests run fastAF subclass 3 doesn't waste time on initAllUp… to the nth degree

This is an expecially hard test set for appDeli and abstractDataController, but watch what happens. - In theory I will have a clean and clear interface to what each layer requires and exposes

