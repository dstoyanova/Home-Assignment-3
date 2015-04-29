//
//  ViewController.m
//  Home-Assignment-3
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray* albums;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[AlbumSingleton sharedAlbum] generateAlbums];
    albums = [[AlbumSingleton sharedAlbum] albums];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 83;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [albums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* reuseIdentifier = @"CustomCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    Album* album = [albums objectAtIndex:indexPath.row];
    
    UIImageView* albumCover = (UIImageView*)[cell viewWithTag:100];
    albumCover.image = [UIImage imageNamed:[album albumCoverName]];
    
    UILabel* albumTitle = (UILabel*)[cell viewWithTag:101];
    albumTitle.text = [album albumTitle];
    
    UILabel* albumArtist = (UILabel*)[cell viewWithTag:102];
    albumArtist.text = [album albumArtist];
    
    UILabel* albumNumberOfSongs = (UILabel*)[cell viewWithTag:103];
    albumNumberOfSongs.text = [NSString stringWithFormat:@"%li songs in total",[[album getNumberOfSongs] longValue]];
    
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
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[[AlbumSingleton sharedAlbum] albums] removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Album* albumToMove = [albums objectAtIndex:sourceIndexPath.row];
    
    [[[AlbumSingleton sharedAlbum] albums] removeObjectAtIndex:sourceIndexPath.row];
    
    [[[AlbumSingleton sharedAlbum] albums] insertObject:albumToMove atIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[AlbumSingleton sharedAlbum] setAlbumIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ViewAlbumDetails" sender:self];
}

- (IBAction)addAlbum:(id)sender {
    /*
     
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    AddAlbumViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"AlbumDetails"];
    
    [self presentViewController:vc animated:YES completion:nil];
     
    */
    [self performSegueWithIdentifier:@"AddAlbum" sender:self];
}

@end
