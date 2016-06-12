//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Shea Furey-King on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (readwrite) NSString *sentence;
@end

@implementation FISSentence

-(void)assembleSentence; {
    
    //[self.words addObject:self.punctuation];
    
    self.sentence = [[self.words componentsJoinedByString:@" "] stringByAppendingString:self.punctuation];
    
}

-(BOOL)validWord: (NSString *)word {
    if ((word != nil) && (![word isEqual: @""]) && (![word isEqual: @" "])) {
    
    return YES;
    }
    
    else {
        return NO;
    }
}

-(BOOL)validPunctuation: (NSString *)punctuation {
    
    if ([@".?!,;:—" containsString:punctuation] && (punctuation != nil)) {
        
        return YES;
    }
    //NSLog(@"Is punctuation argument a real punctuation mark?: %d", answer);
    else {
        return NO;
    }
    
}

-(BOOL)validIndex: (NSUInteger)index {

    if (index < [self.words count]) {
    
    return YES;
}
else {
    return NO;
}
    //return lessThanOrEqualToWordsInArray;
}


-(void)addWord:(NSString *)word {
    
    
    if ([self validWord:word]) {
    [self.words addObject:word];
    }
    
    [self assembleSentence];
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
     if ([self validPunctuation:punctuation]) {
         
         for (NSString *word in words)
             if ([self validWord:word]) {
                 [self.words addObject:word];
             
         
         NSLog(@"self.punctuation before: %@", self.punctuation);
         self.punctuation = punctuation;
         NSLog(@"self.punctuation after: %@", self.punctuation);
             }
     }
    [self assembleSentence];
}

-(void)removeWordAtIndex:(NSUInteger)index {
    
    if ([self validIndex:index]) {
    [self.words removeObjectAtIndex:index];
    
    }
    [self assembleSentence];
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
    if ([self validIndex:index]) {
    [self.words insertObject:word atIndex:index];
    
    }
    [self assembleSentence];
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    
    if ([self validPunctuation:punctuation] && (punctuation != nil)) {
    self.punctuation = punctuation;
    
    }
    [self assembleSentence];
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    
    if ([self validIndex:index] && [self validWord:word]) {
    [self.words replaceObjectAtIndex:index withObject:word];
    
    }
    [self assembleSentence];
}


@end
