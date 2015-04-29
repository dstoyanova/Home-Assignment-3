//
//  AlbumDetailsViewController.m
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "AlbumDetailsViewController.h"

@interface AlbumDetailsViewController () <UITableViewDataSource, UITableViewDelegate> {
    Album* currentAlbum;
    long index;
}

@end

@implementation AlbumDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    index = [[AlbumSingleton sharedAlbum] albumIndex];
    currentAlbum = [[[AlbumSingleton sharedAlbum] albums] objectAtIndex:index];
    
    self.title = [currentAlbum albumTitle];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.coverImageView.image = [UIImage imageNamed:[currentAlbum albumCoverName]];
    self.albumTitleLabel.text = [NSString stringWithFormat:@"%@, %i", [currentAlbum albumTitle], [[currentAlbum albumReleaseYear] intValue]];
    self.albumArtistLabel.text = [currentAlbum albumArtist];
    self.albumSongsLabel.text = [NSString stringWithFormat:@"%li songs in total",[[currentAlbum albumSongs] count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 59;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[currentAlbum albumSongs] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* reuseIdentifier = @"SongCustomCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    Song* song = [[currentAlbum albumSongs] objectAtIndex:indexPath.row];
    
    UILabel* songNumber = (UILabel*)[cell viewWithTag:1];
    songNumber.text = [NSString stringWithFormat:@"%i",[[song songNumber] intValue]];
    
    UILabel* songTitle = (UILabel*)[cell viewWithTag:2];
    songTitle.text = [song songTitle];
    
    UILabel* songArtist = (UILabel*)[cell viewWithTag:3];
    songArtist.text = [song songArtist];
    
    return cell;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [[currentAlbum albumSongs] count] - 1) {
        return UITableViewCellEditingStyleInsert;
    }
    else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[[[[AlbumSingleton sharedAlbum] albums] objectAtIndex:index] albumSongs] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        long songNumber = [[currentAlbum albumSongs] count] + 1;
        
        Song* newSong = [[Song alloc] initWithNumber:[NSNumber numberWithLong:songNumber]
                                                title:@""
                                               artist:[currentAlbum albumArtist]];
        
        [[[[[AlbumSingleton sharedAlbum] albums] objectAtIndex:index] albumSongs] addObject:newSong];
        [tableView insertRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
