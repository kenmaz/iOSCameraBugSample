//
//  CameraOverlayViewController.m
//  CameraSample
//
//  Created by 松前　健太郎 on 13/02/06.
//  Copyright (c) 2013年 kenmaz.net. All rights reserved.
//

#import "CameraOverlayViewController.h"

@implementation CameraOverlayViewController

- (id)init {
    if ((self = [super init])) {
        NSLog(@"CameraOverlayViewController init");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"CameraOverlayViewController dealloc");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton* shutterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shutterButton.frame = CGRectMake(100, 100, 100, 50);
    [shutterButton setTitle:@"shutter" forState:UIControlStateNormal];
    [shutterButton addTarget:self.delegate action:@selector(touchShutterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shutterButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(100, 200, 100, 50);
    [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self.delegate action:@selector(touchCancelButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
}

@end
