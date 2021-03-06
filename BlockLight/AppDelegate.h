//
//  AppDelegate.h
//  BlockLight
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainStageViewController.h"
#import "userData.h"
#import "Production.h" 
#import "homeMasterViewController.h"
#import "GroupViewController.h"
#import "DummyMainViewController.h"
#import "TVNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
  TVNavigationController* _navController;
  UINavigationController* _navControllerEdit;
  DummyMainViewController* _dummymainViewController;
	MainStageViewController* _mainStageViewController;
  userData* _userData;

}

-(void)saveData;
-(void)toggleSplitViewWithProduction:(Production*)production andGroup:(Group*)group;
-(void)toggleEditViewWithGroup:(Group*)group;
-(void)toggleSandboxView;

@property (strong) TVNavigationController* navController;
@property (strong, nonatomic) UIWindow *window;
@property (strong) UISplitViewController *splitViewController;
@property (strong) userData* userData; 


@end
