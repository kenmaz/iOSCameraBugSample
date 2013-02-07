//
//  ViewController.m
//  cameraOrientationSample
//
//  Created by 松前　健太郎 on 13/02/05.
//  Copyright (c) 2013年 kenmaz.net. All rights reserved.
//

#import "ViewController.h"
#import "CameraController.h"
#import "AppDelegate.h"

@implementation ViewController {
    CameraController* _cameraController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _cameraController = [[CameraController alloc] init];  //この行をviewDidLoadに移動すればバグは回避できるけど
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.imageView.image = appDelegate.currentImage;
}

- (IBAction)touchButton:(id)sender {
    [_cameraController showCameraWithRootViewController:self];
}

@end
