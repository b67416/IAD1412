//
//  MainMenuScene.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 11/18/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameScene.h"
#import "CreditsScene.h"
#import "InstructionsScene.h"
#import <GameKit/GameKit.h>

@implementation MainMenuScene
{
    SKSpriteNode *buttonCredits;
    SKSpriteNode *buttonInstructions;
    SKSpriteNode *buttonPlay;
}

- (void)didMoveToView:(SKView *)view {
    SKSpriteNode *mainMenuBackgroundSprite = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu.png"];
    mainMenuBackgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:mainMenuBackgroundSprite];
    
    buttonCredits = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu-Credits.png"];
    buttonCredits.position = CGPointMake(self.frame.size.width - (buttonCredits.size.width / 2) - 30, 50);
    [self addChild:buttonCredits];
    
    buttonInstructions = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu-Instructions.png"];
    buttonInstructions.position = CGPointMake(self.frame.size.width - (buttonInstructions.size.width / 2) - 30, 120);
    [self addChild:buttonInstructions];
    
    buttonPlay = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu-Play.png"];
    buttonPlay.position = CGPointMake(self.frame.size.width - (buttonPlay.size.width / 2) - 30, 190);
    [self addChild:buttonPlay];

    
    // Log in to game center if able //
    
    [GKLocalPlayer localPlayer].authenticateHandler = ^(UIViewController *viewController, NSError *error) {
        if (viewController != nil) {
            [self.view.window.rootViewController presentViewController:viewController animated:YES completion:nil];
        }
    };

    
    
    // Check to see if user played 2 days in a row, if so, then award measurement achievement
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDate *lastPlayedDate = [userDefaults objectForKey:@"achievement_lastPlayedDate"];
    NSDate *nowDate = [[NSDate alloc] init];
    
    if (lastPlayedDate == nil) {
        [userDefaults setObject:nowDate forKey:@"achievement_lastPlayedDate"];
    } else {
        NSNumber *daysSince = [NSNumber numberWithFloat:[nowDate timeIntervalSinceDate:lastPlayedDate] / 60 / 60 / 24];
        
        if (daysSince.integerValue == 2) {
            // User played for two days in a row! //
            NSLog(@"Achievment Awarded: Played for two days in a row");
            
            GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:@"two_days_in_row"];
            achievement.percentComplete = 100.0;
            achievement.showsCompletionBanner = true;
            
            [GKAchievement reportAchievements:@[achievement] withCompletionHandler:nil];
        } else if (daysSince.integerValue > 2) {
            // Too many days have passed, reset play date to now //
            [userDefaults setObject:nowDate forKey:@"achievement_lastPlayedDate"];
        }
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];

    if ([buttonPlay containsPoint:location]) {
        [self.view presentScene:[GameScene sceneWithSize:self.size] transition:[SKTransition doorsOpenHorizontalWithDuration:1]];
    } else if ([buttonCredits containsPoint:location]) {
        [self.view presentScene:[CreditsScene sceneWithSize:self.size] transition:[SKTransition doorsOpenHorizontalWithDuration:1]];
    } else if ([buttonInstructions containsPoint:location]) {
        [self.view presentScene:[InstructionsScene sceneWithSize:self.size] transition:[SKTransition doorsOpenHorizontalWithDuration:1]];
    }
}


@end
