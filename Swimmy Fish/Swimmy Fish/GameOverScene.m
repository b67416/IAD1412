//
//  GameOverScene.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 11/12/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "GameOverScene.h"
#import "MainMenuScene.h"

#import <Social/Social.h>

@implementation GameOverScene

- (void)didMoveToView:(SKView *)view {
    NSLog(@"Score = %ld", (long)self.playerWhackScore);
    
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
   // UITouch *touch = [touches anyObject];
   // CGPoint location = [touch locationInNode:self];
    
   // if ([twitterButton containsPoint:location]) {
   //     if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
   //         SLComposeViewController *tweetViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
   //         [tweetViewController setInitialText:@"Swimmy Fish! rocks!!"];
            
   //         [self.view.window.rootViewController presentViewController:tweetViewController animated:YES completion:^{
   //             [self presentMainMenuScene];
   //         }];
   //     }
   // } else {

    [self.view presentScene:[MainMenuScene sceneWithSize:self.size] transition:[SKTransition doorsOpenHorizontalWithDuration:.5]];
   
    // }
}

@end
