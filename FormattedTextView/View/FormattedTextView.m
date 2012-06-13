//
//  FormattedTextView.m
//  FormattedTextView
//
//  Created by Richard Owens on 5/23/12.
//  Copyright (c) 2012 Richard J Owens. All rights reserved.
//

#import "FormattedTextView.h"

@implementation FormattedTextView

@synthesize textLayer;
@synthesize textHeight;

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textLayer = [[CATextLayer alloc] init];
        self.textLayer.contentsScale = [[UIScreen mainScreen] scale];
        self.textLayer.backgroundColor = [UIColor clearColor].CGColor;
        self.textLayer.wrapped = YES;
        [self.layer addSublayer:self.textLayer];
    }
    return self;
}

- (void)setPadding:(NSArray *)_padding {
    padding = _padding;
    if (formattedText) {
        [self renderText];
    }
}

- (NSArray*)padding {
    return padding;
}

- (void)setFormattedText:(NSString *)_formattedText {
    formattedText = _formattedText;
    [self renderText];
}

- (NSString*)formattedText {
    return formattedText;
}

- (void)renderText {
    NSAttributedString* attrStr = [FormattedTextHelper createAttributedString:self.formattedText];
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) attrStr);
    CGSize suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, 
                                                                        CFRangeMake(0, attrStr.length),
                                                                        nil,
                                                                        CGSizeMake(self.frame.size.width - [[self.padding objectAtIndex:1] floatValue] - [[self.padding objectAtIndex:3] floatValue],
                                                                                   10000),
                                                                        nil);
    self.textLayer.string = attrStr;
    self.textLayer.frame = CGRectMake([[self.padding objectAtIndex:3] floatValue],
                                      [[self.padding objectAtIndex:0] floatValue],
                                      self.frame.size.width - [[self.padding objectAtIndex:1] floatValue] - [[self.padding objectAtIndex:3] floatValue],
                                      suggestedSize.height);
    self.textHeight = suggestedSize.height + [[self.padding objectAtIndex:0] floatValue] + [[self.padding objectAtIndex:2] floatValue];
    [self setContentSize:CGSizeMake(self.frame.size.width, suggestedSize.height + [[self.padding objectAtIndex:0] floatValue] + [[self.padding objectAtIndex:2] floatValue])];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
