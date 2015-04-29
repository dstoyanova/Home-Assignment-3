//
//  Song.h
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic,strong) NSNumber* songNumber;
@property (nonatomic,strong) NSString* songTitle;
@property (nonatomic,strong) NSString* songArtist;

- (id)initWithNumber:(NSNumber*)pNumber title:(NSString*)pTitle artist:(NSString*)pArtist;

@end
