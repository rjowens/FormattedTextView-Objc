//
//  FormattedTextHelper.m
//  FormattedTextView
//
//  Created by Richard Owens on 5/23/12.
//  Copyright (c) 2012 Richard J Owens. All rights reserved.
//

#import "FormattedTextHelper.h"

@implementation FormattedTextHelper

+ (NSAttributedString*)createAttributedString:(NSString*)formattedString {
    NSError* error;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"\\{@(.*?):(.*?):(.*?)\\}" 
                                                                           options:NSRegularExpressionCaseInsensitive 
                                                                             error:&error];
    NSMutableArray* matchData = [[NSMutableArray alloc] init];
    
    NSArray *matches = [regex matchesInString:formattedString
                                      options:0
                                        range:NSMakeRange(0, [formattedString length])];
    
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] init];
    
    for (NSTextCheckingResult *match in matches) {
        
        NSString* font = [formattedString substringWithRange:[match rangeAtIndex:1]];
        NSString* size = [formattedString substringWithRange:[match rangeAtIndex:2]];
        NSString* color = [formattedString substringWithRange:[match rangeAtIndex:3]];
        
        [matchData addObject:[NSArray arrayWithObjects:[NSArray arrayWithObjects:font, size, color, nil],
                              match, nil]];
    }
    
    for (NSArray* thisMatchData in matchData) {
        NSString* font = [[thisMatchData objectAtIndex:0] objectAtIndex:0];
        NSString* size = [[thisMatchData objectAtIndex:0] objectAtIndex:1];
        NSString* color = [[thisMatchData objectAtIndex:0] objectAtIndex:2];
        
        CTFontRef ctFont = CTFontCreateWithName((__bridge CFStringRef)font, [size intValue], nil);
        
//        NSDictionary* attributes = @{
//            (id)kCTFontAttributeName : (__bridge id)ctFont,
//            (id)kCTForegroundColorAttributeName : [ColorHelper rgbaStringToUIColor:color].CGColor
//        };
        
        
        NSDictionary* attributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:(__bridge id)ctFont, 
                                                                        [ColorHelper rgbaStringToUIColor:color].CGColor,
                                                                        nil]
                                                               forKeys:[NSArray arrayWithObjects:(id)kCTFontAttributeName,
                                                                        (id)kCTForegroundColorAttributeName,
                                                                        nil]];
        int endPos = 0;
        NSRange thisRange = [[thisMatchData objectAtIndex:1] rangeAtIndex:0];
        if ([matchData indexOfObject:thisMatchData] == [matchData count] - 1) {
            endPos = formattedString.length;
        } else {
            NSRange nextRange = [[[matchData objectAtIndex:[matchData indexOfObject:thisMatchData] + 1] objectAtIndex:1] rangeAtIndex:0];
            endPos = nextRange.location;
        }
        
       [attrStr appendAttributedString:[[NSAttributedString alloc] initWithString:[formattedString substringWithRange:NSMakeRange(thisRange.location + thisRange.length, endPos - (thisRange.location + thisRange.length))] 
                                                                                                           attributes:attributes]]; 
        
        
        
    }
    
    NSLog(@"%@", attrStr);
    
    return attrStr;    
}

@end
