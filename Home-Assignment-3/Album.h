//
//  Album.h
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic,strong) NSString* albumTitle;
@property (nonatomic,strong) NSString* albumArtist;
@property (nonatomic,strong) NSMutableArray* albumSongs;
@property (nonatomic,strong) NSNumber* albumReleaseYear;
@property (nonatomic,strong) NSString* albumCoverName;

- (id)initWithTitle:(NSString*)pTitle artist:(NSString*)pArtist releaseYear:(NSNumber*)pReleaseYear cover:(NSString*)pCoverName;
- (NSNumber*)getNumberOfSongs;

@end
