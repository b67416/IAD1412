//
//  LeaderboardScene.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 12/10/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "LeaderboardScene.h"
#import "MainMenuScene.h"

@implementation LeaderboardScene
{
    SKSpriteNode *button_1_5;
    SKSpriteNode *button_6_10;
    
    SKSpriteNode *button_1_5_Selected;
    SKSpriteNode *button_6_10_Selected;
    
    SKLabelNode *highScore1;
    SKLabelNode *highScore2;
    SKLabelNode *highScore3;
    SKLabelNode *highScore4;
    SKLabelNode *highScore5;
    SKLabelNode *highScore6;
    SKLabelNode *highScore7;
    SKLabelNode *highScore8;
    SKLabelNode *highScore9;
    SKLabelNode *highScore10;
}

- (void)didMoveToView:(SKView *)view {
    // Setup Leaderboard Background //
    
    SKSpriteNode *leaderboardBackground = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard"];
    leaderboardBackground.position = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    [self addChild:leaderboardBackground];

    
    
    // Get the high scores //
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *highScoresArray = [userDefaults arrayForKey:@"highScores"];

    
    
    // Load Buttons //
    
    button_1_5 = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-1-5"];
    button_1_5_Selected = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-1-5-Selected"];
    
    button_1_5.position = CGPointMake(240, 215);
    button_1_5_Selected.position = CGPointMake(240, 215);
    
    button_1_5.yScale = 1.5;
    button_1_5_Selected.yScale = 1.5;
    
    button_1_5.hidden = YES;
    button_1_5_Selected.hidden = YES;
    
    button_6_10 = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-6-10"];
    button_6_10_Selected = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-6-10-Selected"];
    
    button_6_10.position = CGPointMake(370, 215);
    button_6_10_Selected.position = CGPointMake(370, 215);
    
    button_6_10.yScale = 1.5;
    button_6_10_Selected.yScale = 1.5;
    
    button_6_10.hidden = YES;
    button_6_10_Selected.hidden = YES;
    
    [self addChild:button_1_5];
    [self addChild:button_1_5_Selected];
    [self addChild:button_6_10];
    [self addChild:button_6_10_Selected];
    
    
    
    // Load High Score Labels //
    
    highScore1 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore2 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore3 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore4 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore5 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore6 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore7 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore8 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore9 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore10 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    
    highScore1.text = @"#1\t\t--\t\t\t\tEmpty";
    highScore2.text = @"#2\t\t--\t\t\t\tEmpty";
    highScore3.text = @"#3\t\t--\t\t\t\tEmpty";
    highScore4.text = @"#4\t\t\t--\t\t\t\tEmpty";
    highScore5.text = @"#5\t\t--\t\t\t\tEmpty";
    highScore6.text = @"#6\t\t--\t\t\t\tEmpty";
    highScore7.text = @"#7\t\t--\t\t\t\tEmpty";
    highScore8.text = @"#8\t\t--\t\t\t\tEmpty";
    highScore9.text = @"#9\t\t--\t\t\t\tEmpty";
    highScore10.text = @"#10\t\t--\t\t\t\tEmpty";
    
    highScore1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore2.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore3.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore4.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore5.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore6.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore7.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore8.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore9.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore10.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    highScore1.position = CGPointMake(160, 160);
    highScore2.position = CGPointMake(160, 130);
    highScore3.position = CGPointMake(160, 100);
    highScore4.position = CGPointMake(160, 70);
    highScore5.position = CGPointMake(160, 40);
    
    highScore6.position = CGPointMake(160, 160);
    highScore7.position = CGPointMake(160, 130);
    highScore8.position = CGPointMake(160, 100);
    highScore9.position = CGPointMake(160, 70);
    highScore10.position = CGPointMake(160, 40);
    
    highScore1.hidden = YES;
    highScore2.hidden = YES;
    highScore3.hidden = YES;
    highScore4.hidden = YES;
    highScore5.hidden = YES;
    highScore6.hidden = YES;
    highScore7.hidden = YES;
    highScore8.hidden = YES;
    highScore9.hidden = YES;
    highScore10.hidden = YES;
    
    [self addChild:highScore1];
    [self addChild:highScore2];
    [self addChild:highScore3];
    [self addChild:highScore4];
    [self addChild:highScore5];
    [self addChild:highScore6];
    [self addChild:highScore7];
    [self addChild:highScore8];
    [self addChild:highScore9];
    [self addChild:highScore10];
    
    [self setupScores_1_5];

    
    
    //    NSNumber *scoreNumber = [highScoreEntry objectForKey:@"score"];
    //    NSString *scoreUsername = [highScoreEntry objectForKey:@"username"];
        
    //    NSLog(@"Rank #%ld\t%ld\t%@", (long)scoreIndex++, (long)scoreNumber.integerValue, scoreUsername);
    
    

}

- (void)setupScores_1_5 {
    button_1_5.hidden = YES;
    button_1_5_Selected.hidden = NO;

    button_6_10.hidden = NO;
    button_6_10_Selected.hidden = YES;
    
    highScore1.hidden = NO;
    highScore2.hidden = NO;
    highScore3.hidden = NO;
    highScore4.hidden = NO;
    highScore5.hidden = NO;
    
    highScore6.hidden = YES;
    highScore7.hidden = YES;
    highScore8.hidden = YES;
    highScore9.hidden = YES;
    highScore10.hidden = YES;
}

- (void)setupScores_6_10 {
    button_1_5.hidden = NO;
    button_1_5_Selected.hidden = YES;
    
    button_6_10.hidden = YES;
    button_6_10_Selected.hidden = NO;
    
    highScore1.hidden = YES;
    highScore2.hidden = YES;
    highScore3.hidden = YES;
    highScore4.hidden = YES;
    highScore5.hidden = YES;
    
    highScore6.hidden = NO;
    highScore7.hidden = NO;
    highScore8.hidden = NO;
    highScore9.hidden = NO;
    highScore10.hidden = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if ([button_1_5_Selected containsPoint:location]) {
        [self setupScores_1_5];
    } else if ([button_6_10_Selected containsPoint:location]) {
        [self setupScores_6_10];
    } else {
        [self.view presentScene:[MainMenuScene sceneWithSize:self.size] transition:[SKTransition doorsCloseHorizontalWithDuration:1]];
    }
}

@end
