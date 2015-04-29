//
//  AlbumDetailsViewController.h
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
#import "Album.h"
#import "AlbumSingleton.h"

@interface AlbumDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumArtistLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumSongsLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
