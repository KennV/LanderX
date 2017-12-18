//
//  DetailViewController.h
//  LanderX
//
//  Created by Kenn Villegas on 12/12/17.
//  Copyright © 2017 dubian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LanderX+CoreDataModel.h"

@interface KDVMapDetailViewController : UIViewController

@property (strong, nonatomic) KDVRootEntity *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

