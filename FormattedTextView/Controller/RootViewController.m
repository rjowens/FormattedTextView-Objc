//
//  RootViewController.m
//  FormattedTextView
//
//  Created by Richard Owens on 5/24/12.
//  Copyright (c) 2012 Richard J Owens. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [ColorHelper rgbaStringToUIColor:@"rgba(213,222,217,1)"];
    
    FormattedTextView* ftv = [[FormattedTextView alloc] initWithFrame:CGRectMake(10, 20, self.view.bounds.size.width - 20, self.view.bounds.size.height - 20)];
    ftv.layer.cornerRadius = 2;
    ftv.backgroundColor = UIColor.whiteColor;
    ftv.padding = [NSArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:10], [NSNumber numberWithInt:10], [NSNumber numberWithInt:10], nil];
    ftv.formattedText = @"{@AmericanTypewriter:16:rgba(0,0,0,1.0)}Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    ftv.frame = CGRectMake(ftv.frame.origin.x, ftv.frame.origin.y, ftv.frame.size.width, ftv.textHeight);    
    ftv.layer.borderColor = [ColorHelper rgbaStringToUIColor:@"rgba(124,106,81,1)"].CGColor;
    ftv.layer.borderWidth = 1.0;
    [self.view addSubview:ftv];
    
    FormattedTextView* ftv2 = [[FormattedTextView alloc] initWithFrame:CGRectMake(10, ftv.frame.origin.y + ftv.frame.size.height + 15, self.view.bounds.size.width - 20, self.view.bounds.size.height - 20)];
    ftv2.layer.cornerRadius = 2;
    ftv2.backgroundColor = UIColor.whiteColor;
    ftv2.padding = [NSArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:10], [NSNumber numberWithInt:10], [NSNumber numberWithInt:10], nil];
    ftv2.formattedText = @"{@AmericanTypewriter:16:rgba(128,0,0,1.0)}Lorem ipsum{@AmericanTypewriter:16:rgba(0,0,0,1.0)} dolor sit amet, {@AmericanTypewriter-Bold:16:rgba(0,0,0,1.0)}consectetur{@AmericanTypewriter:16:rgba(0,0,0,1.0)} adipiscing elit.";
    ftv2.frame = CGRectMake(ftv2.frame.origin.x, ftv2.frame.origin.y, ftv2.frame.size.width, ftv2.textHeight);    
    ftv2.layer.borderColor = [ColorHelper rgbaStringToUIColor:@"rgba(124,106,81,1)"].CGColor;
    ftv2.layer.borderWidth = 1.0;
    [self.view addSubview:ftv2];
        
    FormattedTextView* ftv3 = [[FormattedTextView alloc] initWithFrame:CGRectMake(10, ftv2.frame.origin.y + ftv2.frame.size.height + 15, self.view.bounds.size.width - 20, 280)];
    ftv3.layer.cornerRadius = 2;
    ftv3.backgroundColor = UIColor.whiteColor;
    ftv3.padding = [NSArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:10], [NSNumber numberWithInt:10], [NSNumber numberWithInt:10], nil];
    ftv3.formattedText = @"{@AmericanTypewriter:16:rgba(128,0,0,1.0)}Lorem ipsum{@AmericanTypewriter:16:rgba(0,0,0,1.0)} dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \
        \
        \
        {@AmericanTypewriter-Bold:16:rgba(0,0,0,1.0)}Lorem ipsum{@AmericanTypewriter:16:rgba(0,0,0,1.0)} dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    
//    ftv3.frame = CGRectMake(ftv3.frame.origin.x, ftv3.frame.origin.y, ftv3.frame.size.width, ftv3.textHeight);    
    ftv3.layer.borderColor = [ColorHelper rgbaStringToUIColor:@"rgba(124,106,81,1)"].CGColor;
    ftv3.layer.borderWidth = 1.0;
    [self.view addSubview:ftv3];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
