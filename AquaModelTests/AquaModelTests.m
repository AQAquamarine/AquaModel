#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "AQMModel.h"

#import "Album.h"
#import "Dog.h"

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
    
    describe(@"anyOf validator", ^{
        it(@"should pass when the name is Pochi", ^{
            Dog *dog = [[Dog alloc] init];
            dog.name = @"Pochi";
            expect(dog.validate).to.equal(YES);
        });
        
        it(@"should not pass when the name is Gozilla", ^{
            Dog *dog = [[Dog alloc] init];
            dog.name = @"Gozilla";
            expect(dog.validate).to.equal(NO);
        });
    });
});

SpecEnd