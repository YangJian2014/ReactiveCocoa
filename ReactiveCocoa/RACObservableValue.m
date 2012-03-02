//
//  RACObservableValue.m
//  ReactiveCocoa
//
//  Created by Josh Abernathy on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RACObservableValue.h"
#import "RACObservableSequence+Private.h"


@implementation RACObservableValue


#pragma mark RACObservableSequence

- (void)addObjectAndNilsAreOK:(id)object {
	self.value = object;
}


#pragma mark API

+ (id)valueWithValue:(id)v {
	return [[self alloc] initWithValue:v];
}

- (id)initWithValue:(id)v {
	self = [super initWithCapacity:1];
	if(self == nil) return nil;
	
	self.value = v;
	
	return self;
}

- (void)setValue:(id)v {
	[super addObjectAndNilsAreOK:v];
	
	if(v == nil) {
		[self removeFirstObject];
	}
}

- (id)value {
	return [self lastObject];
}

@end
