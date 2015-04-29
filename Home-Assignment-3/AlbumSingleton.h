//
//  AlbumSingleton.h
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"
#import "Song.h"

@interface AlbumSingleton : NSObject

@property (nonatomic,strong) NSMutableArray* albums;
@property (nonatomic) long albumIndex;

+ (id)sharedAlbum;

- (void)generateAlbums;
- (void)setAlbumIndex:(long)albumIndex;

@end
