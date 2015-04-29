//
//  AlbumSingleton.m
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "AlbumSingleton.h"

@implementation AlbumSingleton

+ (id)sharedAlbum {
    static AlbumSingleton* sharedMyAlbum = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedMyAlbum = [[self alloc] init];
    });
    return sharedMyAlbum;
}

- (id)init {
    if (self = [super init]) {
        _albums = [NSMutableArray array];
    }
    return self;
}

- (void)generateAlbums {
    Album* a1 = [[Album alloc] initWithTitle:@"Alive"
                                      artist:@"Jessie J"
                                 releaseYear:[NSNumber numberWithInt:2012]
                                       cover:@"Alive.jpg"];
    
    Song* s1 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:1]
                                      title:@"It's my party"
                                     artist:@"Jessie J"];
    Song* s2 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:2]
                                      title:@"Thunder"
                                     artist:@"Jessie J"];
    Song* s3 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:3]
                                      title:@"Square one"
                                     artist:@"Jessie J"];
    
    [[a1 albumSongs] addObjectsFromArray:[NSArray arrayWithObjects:s1, s2, s3, nil]];
    
    Album* a2 = [[Album alloc] initWithTitle:@"Not Afraid"
                                      artist:@"Eminem"
                                 releaseYear:[NSNumber numberWithInt:2010]
                                       cover:@"Not Afraid.jpg"];
    
    Song* s11 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:1]
                                      title:@"Not afraid"
                                     artist:@"Eminem"];
    Song* s12 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:2]
                                      title:@"Beautiful"
                                     artist:@"Eminem"];
    
    [[a2 albumSongs] addObjectsFromArray:[NSArray arrayWithObjects:s11, s12, nil]];
    
    Album* a3 = [[Album alloc] initWithTitle:@"Superheroes"
                                      artist:@"The Script"
                                 releaseYear:[NSNumber numberWithInt:2014]
                                       cover:@"Superheroes.jpg"];
    
    Song* s21 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:1]
                                      title:@"Superheroes"
                                     artist:@"The Script"];
    Song* s22 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:2]
                                      title:@"If only you could see me now"
                                     artist:@"The Script"];
    Song* s23 = [[Song alloc] initWithNumber:[NSNumber numberWithInt:3]
                                      title:@"Hall of fame"
                                     artist:@"The Script"];
    
    [[a3 albumSongs] addObjectsFromArray:[NSArray arrayWithObjects:s21, s22, s23, nil]];
    
    _albums = [NSMutableArray arrayWithObjects:a1, a2, a3, nil];
}

- (void)setAlbumIndex:(long)albumIndex {
    _albumIndex = albumIndex;
}

@end
