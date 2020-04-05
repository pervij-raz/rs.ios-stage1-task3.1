#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if ([numbers count] == 0) {
        return nil;
    }
    NSMutableString*result = [NSMutableString new];
    for (int i = 0; i < [numbers count]; i++) {
        int a = (int)[numbers count] - 1 - i;
        if (a > 1) {
            if ([numbers[i] intValue] == 1) {
                [result appendString:[NSString stringWithFormat:@" + x^%d", a]];
            } else if ([numbers[i] intValue] == - 1) {
                [result appendString:[NSString stringWithFormat:@" - x^%d", a]];
            }
            else if ([numbers[i] intValue] == 0) {
                continue;
            } else if ([numbers[i] intValue] < 0) {
                int b = [numbers[i] intValue] * -1;
                [result appendString:[NSString stringWithFormat:@" - %dx^%d", b, a]];
            } else {
                [result appendString:[NSString stringWithFormat:@" + %@x^%d", numbers[i], a]];
            }
        } else if (a == 1) {
            if ([numbers[i] intValue] == 1) {
                [result appendString:[NSString stringWithFormat:@" + x"]];
            } else if ([numbers[i] intValue] == - 1) {
                [result appendString:[NSString stringWithFormat:@" - x"]];
            }
            else if ([numbers[i] intValue] == 0) {
                continue;
            } else if ([numbers[i] intValue] < 0) {
                int b = [numbers[i] intValue] * -1;
                [result appendString:[NSString stringWithFormat:@" - %dx", b]];
            } else {
                [result appendString:[NSString stringWithFormat:@" + %@x", numbers[i]]];
            }
        } else if (a == 0) {
            if ([numbers[i] intValue] == 1) {
                [result appendString:[NSString stringWithFormat:@" + 1"]];
            } else if ([numbers[i] intValue] == - 1) {
                [result appendString:[NSString stringWithFormat:@" - 1"]];
            }
            else if ([numbers[i] intValue] == 0) {
                continue;
            } else if ([numbers[i] intValue] < 0) {
                int b = [numbers[i] intValue] * -1;
                [result appendString:[NSString stringWithFormat:@" - %d", b]];
            } else {
                [result appendString:[NSString stringWithFormat:@" + %@", numbers[i]]];
            }
        }
    }
    return [result substringWithRange:NSMakeRange(3, [result length]-3)];
}
@end
