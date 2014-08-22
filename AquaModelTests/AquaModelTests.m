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
    
    describe(@"shorterThan validator", ^{
        it(@"should pass when the title is shorter than 10", ^{
            Album *album = [[Album alloc] init];
            album.title = @"Hawaii";
            expect(album.validate).to.equal(YES);
        });
        
        it(@"should not pass when the title is longer than 10", ^{
            Album *album = [[Album alloc] init];
            album.title = @"Hawaii Hawaii Hawaii";
            expect(album.validate).to.equal(NO);
        });
    });
    
    describe(@"longerThan validator", ^{
        it(@"should pass when the title is longer than 3", ^{
            Album *album = [[Album alloc] init];
            album.title = @"Hawaii";
            expect(album.validate).to.equal(YES);
        });
        
        it(@"should not pass when the title is shorter than 3", ^{
            Album *album = [[Album alloc] init];
            album.title = @"H";
            expect(album.validate).to.equal(NO);
        });
    });
});

SpecEnd