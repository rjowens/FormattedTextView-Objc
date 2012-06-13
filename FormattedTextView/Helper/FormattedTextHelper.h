//
//  FormattedTextHelper.h
//  FormattedTextView
//
//  Created by Richard Owens on 5/23/12.
//  Copyright (c) 2012 Richard J Owens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface FormattedTextHelper : NSObject {
}

+ (NSAttributedString*)createAttributedString:(NSString*)formattedString;

@end
