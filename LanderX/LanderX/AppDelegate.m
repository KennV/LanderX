/**
  AppDelegate.m
  LanderX

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.
*/

#import "AppDelegate.h"
#import "KDVMapDetailViewController.h"
#import "KDVPrimeTVController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
  UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
  navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
  splitViewController.delegate = self;

  UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
  KDVPrimeTVController *controller = (KDVPrimeTVController *)masterNavigationController.topViewController;
  controller.managedObjectContext = self.PSK.viewContext;
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
  [self saveContext];
}


#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[KDVMapDetailViewController class]] && ([(KDVMapDetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Core Data stack

/**
 # Kinda important #
 ### Moving the CD Stack ###

 Here is the story so far;
 First set up the application's File Structure, and then make an empty git with the same name, and a gitignore file. Add a few other readme and license assets.
 Refactor the rest in the lowest order of dependency from detail view ->
 KDVMapDetailView, MasterView -> KVPrimeTVControllerView
 Let XCode refactor this _then_ clean and build every change
 Init the git for the project -Empty-
 add the files and an init commit to master
 Add a branch
 Add the project you just made commit and then proceed

 ## _Ideally I would do the GUI First_ ##

However I am very interested in process So the first thing to do is go into the AppDelegate (*this here class*) and customize it a little. I prefer the NSPersistentContainer be named _PSK Then this gets kicked off to another Class as first the
 • KDVAbstractDataController
 • KDVApplicationDataController
 • KDVRootDataController
I am sure there are any number of reasons to _not_ do it this way, but since it is my code and I want it to be modularAF this really is the best way forward.
 [_sidenote; as I plow through these classes the first thing to do is to append / fix that boilerplate preamble_]
 
 
..
*/

@synthesize PSK = _PSK;

- (NSPersistentContainer *)PSK {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_PSK == nil) {
            _PSK = [[NSPersistentContainer alloc] initWithName:@"LanderX"];
            [_PSK loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _PSK;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.PSK.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
