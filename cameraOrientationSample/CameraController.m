//
//  CameraController.m
//  CameraSample
//
//  Created by 松前　健太郎 on 13/02/06.
//  Copyright (c) 2013年 kenmaz.net. All rights reserved.
//

#import "CameraController.h"
#import "AppDelegate.h"
#import "SubImagePickerViewController.h"

@implementation CameraController {
    SubImagePickerViewController* _imagePicker;
    CameraOverlayViewController* _cameraOverlayViewController;
}

- (id)init {
    if ((self = [super init])) {
        NSLog(@"CameraController init");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"CameraController dealloc");
}

- (void)showCameraWithRootViewController:(UIViewController*)rootViewController {
    _imagePicker = [[SubImagePickerViewController alloc] init];
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePicker.showsCameraControls = NO;
    _imagePicker.delegate = self;

    _cameraOverlayViewController = [[CameraOverlayViewController alloc] init];
    _cameraOverlayViewController.delegate = self;
    _cameraOverlayViewController.view.frame = [[UIScreen mainScreen] bounds];
    
    _imagePicker.cameraOverlayView = _cameraOverlayViewController.view;
    
    [rootViewController presentViewController:_imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate<NSObject>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.currentImage = image;

    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - @protocol CameraOverlayViewControllerDelegate
- (void)touchShutterButton {
    [_imagePicker takePicture];
}

- (void)touchCancelButton {
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}

@end
