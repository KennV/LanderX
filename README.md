# The Intention is to Update my CoreData Shim #


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

