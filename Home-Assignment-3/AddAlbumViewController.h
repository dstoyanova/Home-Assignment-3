//
//  AddAlbumViewController.h
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import "AlbumSingleton.h"
#import "ViewController.h"

@interface AddAlbumViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImageView;
@property (weak, nonatomic) IBOutlet UITextField *albumTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *albumArtistTextField;
@property (weak, nonatomic) IBOutlet UITextField *albumReleaseYearTextField;

@end
