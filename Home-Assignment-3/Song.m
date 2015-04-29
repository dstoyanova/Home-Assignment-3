//
//  Song.m
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "Song.h"

@implementation Song

- (id)initWithNumber:(NSNumber *)pNumber title:(NSString *)pTitle artist:(NSString *)pArtist {
    if (self = [super init]) {
        _songNumber = pNumber;
        _songTitle = pTitle;
        _songArtist = pArtist;
    }
    return self;
}

@end
