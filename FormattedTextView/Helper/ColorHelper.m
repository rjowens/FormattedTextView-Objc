//
//  ColorHelper.m
//  FormattedTextView
//
//  Created by Richard Owens on 5/23/12.
//  Copyright (c) 2012 Richard J Owens. All rights reserved.
//

#import "ColorHelper.h"

@implementation ColorHelper

+ (UIColor*) rgbaStringToUIColor:(NSString*) color {
    NSError* error;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"rgba\\((.*),(.*),(.*),(.*)\\)" 
                                                                           options:NSRegularExpressionCaseInsensitive 
                                                                             error:&error];
    NSArray *matches = [regex matchesInString:color
                                      options:0
                                        range:NSMakeRange(0, [color length])];
    
    if ([matches count] == 1) {
        NSTextCheckingResult *match = [matches objectAtIndex:0];
        if (match.numberOfRanges == 5) {
            CGFloat red = [[color substringWithRange:[match rangeAtIndex:1]] floatValue];
            CGFloat blue = [[color substringWithRange:[match rangeAtIndex:2]] floatValue];
            CGFloat green = [[color substringWithRange:[match rangeAtIndex:3]] floatValue];
            CGFloat alpha = [[color substringWithRange:[match rangeAtIndex:4]] floatValue];
            return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];            
        }
    }
    
	return [UIColor blackColor];
    
}


@end
