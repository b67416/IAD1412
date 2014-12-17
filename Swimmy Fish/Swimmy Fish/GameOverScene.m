//
//  GameOverScene.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 11/12/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "GameOverScene.h"
#import "LeaderboardScene.h"
#import "MainMenuScene.h"

#import <GameKit/GameKit.h>

@implementation GameOverScene
{
    NSUserDefaults *userDefaults;
}

- (void)didMoveToView:(SKView *)view {
    SKSpriteNode *gameOverBackground = [SKSpriteNode spriteNodeWithImageNamed:@"GameOver.png"];
    gameOverBackground.position = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    [self addChild:gameOverBackground];
    
    SKLabelNode *playerScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
    playerScoreLabel.fontSize = 32;
    playerScoreLabel.fontColor = [SKColor blackColor];
    playerScoreLabel.text = [NSString stringWithFormat:@"%ld", (long) self.playerWhackScore];
    playerScoreLabel.position = CGPointMake(300, 70);
    [self addChild:playerScoreLabel];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Give the no score or scored once achievements //
    
    if (self.playerWhackScore == 0) {
        GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:@"no_score"];
        achievement.percentComplete = 100.0;
        achievement.showsCompletionBanner = true;
        
        [GKAchievement reportAchievements:@[achievement] withCompletionHandler:nil];
    } else {
        GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:@"score_once"];
        achievement.percentComplete = 100.0;
        achievement.showsCompletionBanner = true;
        
        [GKAchievement reportAchievements:@[achievement] withCompletionHandler:nil];
    }
    
    
    
    // Check for number of times with score more than 10 and apply achievments if so //
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSNumber *playsWithScoreNumber = [defaults objectForKey:@"number_of_plays_greater_than_10"];
    NSInteger playsWithScoreInteger = 0;
    
    if (playsWithScoreNumber == nil) {
        playsWithScoreInteger = 0;
    } else {
        playsWithScoreInteger = playsWithScoreNumber.integerValue;
    }
    
    if (self.playerWhackScore > 10) {
        // Player scored more than 10 so increment the counter and apply achievment if required //
        
        playsWithScoreInteger = playsWithScoreInteger + 1;
        
        if (playsWithScoreInteger == 6) {
            GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:@"six_x_greater_ten"];
            achievement.percentComplete = 100.0;
            achievement.showsCompletionBanner = true;
            
            [GKAchievement reportAchievements:@[achievement] withCompletionHandler:nil];
            
            playsWithScoreInteger = 0;
        } else if (playsWithScoreInteger == 4) {
            GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:@"four_x_greater_ten"];
            achievement.percentComplete = 100.0;
            achievement.showsCompletionBanner = true;
            
            [GKAchievement reportAchievements:@[achievement] withCompletionHandler:nil];

            playsWithScoreInteger = 0;
        } else if (playsWithScoreInteger == 2) {
            GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:@"two_x_greater_ten"];
            achievement.percentComplete = 100.0;
            achievement.showsCompletionBanner = true;
            
            [GKAchievement reportAchievements:@[achievement] withCompletionHandler:nil];
 
            playsWithScoreInteger = 0;
        }
    } else {
        // Player didn't score more than 10, so reset the counter //
        
        playsWithScoreInteger = 0;
    }
    
    NSLog(@"playsWithScoreInteger = %ld", (long)playsWithScoreInteger);
    playsWithScoreNumber = [NSNumber numberWithInteger:playsWithScoreInteger];
    [defaults setObject:playsWithScoreNumber forKey:@"number_of_plays_greater_than_10"];
    [defaults synchronize];
    
    
    
    // Post to game center leaderboard or post to local leaderboards //
    
    if ([GKLocalPlayer localPlayer].isAuthenticated) {
        GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:@"topscores"];
        score.value = self.playerWhackScore;
        
        [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
            GKGameCenterViewController *gameCenterViewController = [[GKGameCenterViewController alloc] init];
            
            if (gameCenterViewController != nil) {
                gameCenterViewController.gameCenterDelegate = self;
                gameCenterViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
                
                [self.view.window.rootViewController presentViewController:gameCenterViewController animated:YES completion:nil];
            }
        }];
    } else {
        [self saveLocalLeaderboardScore];
    }
    
    
}

- (void)saveLocalLeaderboardScore {
    
    // Prep for NSUserDefaults //
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    // Get the high scores and decide if high score should be added to leaderboard //
    
    BOOL shouldAddHighScore = NO;
    NSArray *highScoresArray = [userDefaults arrayForKey:@"highScores"];
    
    if (highScoresArray.count < 10) {
        // We want to keep only 10 entries, so if it's less than 10 then we want to add it no matter what //
        shouldAddHighScore = YES;
    } else {
        // Check to see if the current score beats any of the top 10 scores //
        
        for (NSDictionary *highScoreEntry in highScoresArray) {
            NSNumber *scoreNumber = [highScoreEntry objectForKey:@"score"];

            if (self.playerWhackScore > scoreNumber.integerValue) {
                shouldAddHighScore = YES;
            }
        }
    }
    
    
    
    // Show the high score username box //
    
    if (shouldAddHighScore && self.playerWhackScore > 0) {
        UIAlertView *usernameInputAlert = [[UIAlertView alloc] initWithTitle:@"New High Score!" message:@"Enter your username" delegate:self cancelButtonTitle:@"Save High Score!" otherButtonTitles: nil];
        usernameInputAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [usernameInputAlert textFieldAtIndex:0].text = [userDefaults stringForKey:@"defaultUsername"];
        [usernameInputAlert show];
    } else {
        [self presentLeaderboardScene];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // Set the default username //
    
    [userDefaults setObject:[alertView textFieldAtIndex:0].text forKey:@"defaultUsername"];
    
    
    
    // Get the high score mutablearray //
    
    NSMutableArray *highScoreArray = [userDefaults mutableArrayValueForKey:@"highScores"];
    
    
    
    // Add high score dictionary to mutablearray //
    
    [highScoreArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:[alertView textFieldAtIndex:0].text, @"username", [NSNumber numberWithInteger:self.playerWhackScore], @"score", nil]];
    
    
    
    // Sort the high score array //
    
    highScoreArray.array = [highScoreArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDictionary *highScoreEntry1 = obj1;
        NSDictionary *highScoreEntry2 = obj2;
        
        NSNumber *highScoreNumber1 = [highScoreEntry1 objectForKey:@"score"];
        NSNumber *highScoreNumber2 = [highScoreEntry2 objectForKey:@"score"];
        
        if (highScoreNumber1.integerValue < highScoreNumber2.integerValue) {
            return (NSComparisonResult) NSOrderedDescending;
        } else if (highScoreNumber1.integerValue > highScoreNumber2.integerValue) {
            return (NSComparisonResult) NSOrderedAscending;
        }
        
        return (NSComparisonResult) NSOrderedSame;
    }];
    
    
    
    // Remove the lowest score if there are more than 10 entries //
    
    if (highScoreArray.count > 10) {
        [highScoreArray removeObjectAtIndex:10];
    }

    [self presentLeaderboardScene];
}

- (void)presentLeaderboardScene {
    [self.view presentScene:[LeaderboardScene sceneWithSize:self.size] transition:[SKTransition doorsOpenHorizontalWithDuration:.5]];
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController*)gameCenterViewController {
    
    UIViewController *vc = self.view.window.rootViewController;
    [vc dismissViewControllerAnimated:YES completion:nil];
    
    [self.view presentScene:[MainMenuScene sceneWithSize:self.size] transition:[SKTransition doorsCloseHorizontalWithDuration:.5]];
}

@end
