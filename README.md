AquaModel
=========

Is currently WIP!

Concepts
---

* Really declarative style!
* Handle remote object really easily.
* Handle CoreData store easily.
* Built-in validators.
* Callbacks.

### Requestable

You can declare the resource URL mapping.

```objc
+ (NSString *)resourceBasePath {
    return @"/albums";
}

+ (NSDictionary *)resourceMap {
    return @{
        @(AQMRequestTypeShow): @[@(AQMRequestMethodGET), @"/:id"],
        @(AQMRequestTypeCreate): @[@(AQMRequestMethodPOST), @"/"],
        @(AQMRequestTypeUpdate): @[@(AQMRequestMethodPATCH), @"/:id"],
        @(AQMRequestTypeDestroy): @[@(AQMRequestMethodDELETE), @"/:id"]
    };
}
```

Then you can

```objc
[Album fetch:@"3"]; // fetches the album.
[album push]; // pushes the change of the instance.
```

### ActiveRecord like interfaces

You can store data into CoreData easily.

```objc
+ (instancetype)create;
- (BOOL)update;
- (BOOL)destroy;
```

### Validation

```objc
+ (NSDictionary *)validationMap {
    return @{
        @"title": @[[AQMValidator presence], [AQMValidator shorterThan:10], [AQMValidator longerThan:3]]
    };
}
```

Then

```objc
album.title = nil
[album validate]; // => NO

album.title = @"Hawaii";
[album validate]; // => YES

album.title = @"LongLongLongLong Title";
[album validate]; // => NO
```

There are some built-in validators. (Or you can add your own.)

```objc
+ (id<AQMValueValidator>)presence;
+ (id<AQMValueValidator>)longerThan:(NSUInteger)length;
+ (id<AQMValueValidator>)shorterThan:(NSUInteger)length;
+ (id<AQMValueValidator>)regexp:(NSRegularExpression *)regexp;
+ (id<AQMValueValidator>)anyOf:(NSArray *)array;

+ (id<AQMValueValidator>)email;
+ (id<AQMValueValidator>)URL;
+ (id<AQMValueValidator>)telephone;
```

Just implement `- (BOOL)validate:(id)value` to use your validator.

### Callbacks

These methods are called for each timing.

```objc
- (void)afterCreate;

- (void)beforeValidation;
- (void)afterValidation;

- (void)beforeSave;
- (void)afterSave;
```

Advanced
---

### Serialization

As AquaModel inherits MTLModel, you can serialize them into / from JSON Dictionary.

```objc
[album dictionaryRepresentation]; // obtain JSON Dictionary

[Album modelWithDictionary:dictionary];
```