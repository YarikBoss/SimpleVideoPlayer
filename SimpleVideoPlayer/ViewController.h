//
//  ViewController.h
//  SimpleVideoPlayer
//
//  Created by Yahimovich Mac on 03.06.15.
//  Copyright (c) 2015 Yahimovich Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,
                                              UINavigationControllerDelegate>

@property (strong, nonatomic) MPMoviePlayerController *videoController;

- (IBAction)captureVideo:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *videoView;

@end

