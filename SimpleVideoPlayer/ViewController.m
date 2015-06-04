//
//  ViewController.m
//  SimpleVideoPlayer
//
//  Created by Yahimovich Mac on 03.06.15.
//  Copyright (c) 2015 Yahimovich Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)captureVideo:(id)sender
{
    // Open from photo folder
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:imagePicker.sourceType];
    
    if (![sourceTypes containsObject:(NSString *)kUTTypeMovie])
    {
        NSLog(@"no video");
    }
    
    [self presentModalViewController:imagePicker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *urlvideo;
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //NSLog(@"type=%@",type);
    
    if ([type isEqualToString:(NSString *)kUTTypeVideo] ||
        [type isEqualToString:(NSString *)kUTTypeMovie])
    {// movie != video
        urlvideo = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    [self dismissModalViewControllerAnimated:YES];
    
    [self startVideoPlayerWithURL:urlvideo];
}

-(void)startVideoPlayerWithURL:(NSURL*)fileURL
{
    if (fileURL != nil)
    {
        _videoController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
        [_videoController.view setFrame:_videoView.frame];
        [_videoController play];
        [_videoView addSubview:_videoController.view];
    }
    else
    {
        NSLog(@"File not found!");
    }
    
}

-(NSURL *)getURLForVideoByName:(NSString *)videoName
{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:videoName ofType:nil];
    return [NSURL fileURLWithPath:filepath];
}

@end
