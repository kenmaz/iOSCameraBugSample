//
//  ViewController.h
//  cameraOrientationSample
//
//  Created by 松前　健太郎 on 13/02/05.
//  Copyright (c) 2013年 kenmaz.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)touchButton:(id)sender;

@end
