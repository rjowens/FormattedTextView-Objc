//
//  FormattedTextView.h
//  FormattedTextView
//
//  Created by Richard Owens on 5/23/12.
//  Copyright (c) 2012 Richard J Owens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface FormattedTextView : UIScrollView {
    NSArray* padding;
    NSString* formattedText;
    CGFloat textHeight;
}

- (void)renderText;

@property (strong) CATextLayer* textLayer;
@property (strong) NSString* formattedText;
@property (assign) NSArray* padding;
@property (assign) CGFloat textHeight;

@end
