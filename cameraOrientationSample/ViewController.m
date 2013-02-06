//
//  ViewController.m
//  cameraOrientationSample
//
//  Created by 松前　健太郎 on 13/02/05.
//  Copyright (c) 2013年 dwango. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController {
    UIImagePickerController* _imagePicker;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchButton:(id)sender {
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePicker.delegate = self;
    _imagePicker.showsCameraControls = NO;
    _imagePicker.toolbarHidden = YES;
    _imagePicker.navigationBarHidden = YES;
    
    CGRect frame = [[UIScreen mainScreen] bounds]; // applicationFrameだと二回目の呼び出しでstatusbar分が入ってしまうので
    CGFloat toolbarHeight = 54;
    
    CGRect toolbarFrame = CGRectMake(0, frame.size.height - toolbarHeight, frame.size.width, toolbarHeight);
    UIView *toolbar = [[UIView alloc] initWithFrame:toolbarFrame];
    toolbar.userInteractionEnabled = YES;
    
    CGSize shotBtnSize = CGSizeMake(54, 54);
    UIButton *shotButton = [[UIButton alloc] initWithFrame:CGRectMake(
                                                                      (toolbarFrame.size.width - shotBtnSize.width) / 2,
                                                                      0,
                                                                      shotBtnSize.width,
                                                                      shotBtnSize.height)];
    [shotButton setImage:[UIImage imageNamed:@"icon.png"] forState:UIControlStateNormal];
    CGSize cancelBtnSize = CGSizeMake(44, 32);
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(
                                                                                    8,
                                                                                    (toolbarHeight - cancelBtnSize.height) / 2 + 2,
                                                                                    cancelBtnSize.width,
                                                                                    cancelBtnSize.height)];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:12];
    cancelButton.titleLabel.textColor = [UIColor yellowColor];
    cancelButton.titleLabel.shadowColor = [UIColor grayColor];
    
    [shotButton addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton addTarget:self action:@selector(cancelCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    [toolbar addSubview:shotButton];
    [toolbar addSubview:cancelButton];
    
    _imagePicker.cameraOverlayView = toolbar;

    [self presentViewController:_imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    NSLog(@"%s", __func__);
    NSLog(@"image orientation: %d", image.imageOrientation);

    self.imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"%s", __func__);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) takePhoto:(id)sender {
    NSLog(@"%s", __func__);
    [_imagePicker takePicture];
}

- (void) cancelCamera:(id)sender {
    NSLog(@"%s", __func__);
    [UIApplication sharedApplication].statusBarHidden = NO;
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}

@end
