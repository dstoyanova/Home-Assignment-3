//
//  Album.m
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)initWithTitle:(NSString *)pTitle artist:(NSString *)pArtist releaseYear:(NSNumber *)pReleaseYear cover:(NSString *)pCoverName{
    if (self = [super init]) {
        _albumTitle = pTitle;
        _albumArtist = pArtist;
        _albumReleaseYear = pReleaseYear;
        _albumSongs = [NSMutableArray array];
        _albumCoverName = pCoverName;
    }
    return self;
}

- (NSNumber*)getNumberOfSongs {
    return [NSNumber numberWithLong:[_albumSongs count]];
}

@end
