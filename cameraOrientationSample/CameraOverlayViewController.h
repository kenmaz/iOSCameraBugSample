//
//  CameraOverlayViewController.h
//  CameraSample
//
//  Created by 松前　健太郎 on 13/02/06.
//  Copyright (c) 2013年 kenmaz.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CameraOverlayViewControllerDelegate
- (void)touchShutterButton;
- (void)touchCancelButton;
@end

@interface CameraOverlayViewController : UIViewController

#warning 本来はweakにすべき箇所
@property /*(weak)*/ id<CameraOverlayViewControllerDelegate> delegate;

@end
