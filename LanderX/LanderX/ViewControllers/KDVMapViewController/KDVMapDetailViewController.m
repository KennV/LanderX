//
//  DetailViewController.m
//  LanderX
//
//  Created by Kenn Villegas on 12/12/17.
//  Copyright © 2017 dubian. All rights reserved.
//

//#import "KDVMapDetailViewController.h"
#import "KDVMapDetailViewController.h"


@interface KDVMapDetailViewController ()

@end

@implementation KDVMapDetailViewController

- (void)configureView {
  // Update the user interface for the detail item.
  if (self.detailItem) {
      self.detailDescriptionLabel.text = self.detailItem.incepDate.description;
  }
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(KDVRootEntity *)newDetailItem {
  if (_detailItem != newDetailItem) {
      _detailItem = newDetailItem;
      
      // Update the view.
      [self configureView];
  }
}


@end
