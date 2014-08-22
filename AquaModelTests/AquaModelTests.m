#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "AQMModel.h"

#import "Album.h"

SpecBegin(AQMModel)

describe(@"Validation", ^{
    describe(@"presence validator", ^{
        it(@"should pass when the title is not nil", ^{
            Album *album = [[Album alloc] init];
            album.title = @"Hawaii";
            expect(album.validate).to.equal(YES);
        });
        
        it(@"should not pass when the title is nil", ^{
            Album *album = [[Album alloc] init];
            expect(album.validate).to.equal(NO);
        });
    });
});

SpecEnd