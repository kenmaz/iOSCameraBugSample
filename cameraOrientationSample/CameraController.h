//
//  CameraController.h
//  CameraSample
//
//  Created by 松前　健太郎 on 13/02/06.
//  Copyright (c) 2013年 kenmaz.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CameraOverlayViewController.h"

@interface CameraController : NSObject <UINavigationControllerDelegate, UIImagePickerControllerDelegate, CameraOverlayViewControllerDelegate>
- (void)showCameraWithRootViewController:(UIViewController*)rootViewController;
@end
