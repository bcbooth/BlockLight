//
//  MainView.m
//  BlockLight
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "MainView.h"

@implementation MainView

@synthesize noteLabel = _noteLabel; 
#pragma mark Constructors
- (id) initWithFrame:(CGRect)frame andViewController:(id)viewController
{
  self = [super initWithFrame:frame];
  if (self == nil)
    return nil;
	
  self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-production.jpg"]];
  
  _noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(600, 30, 100, 300 )];
  _noteLabel.lineBreakMode = UILineBreakModeWordWrap;
  _noteLabel.numberOfLines = 0;
  _noteLabel.textColor = [UIColor blackColor];
  [self addSubview:_noteLabel];
  _noteLabel.backgroundColor = [UIColor clearColor];
  
  _horizontalGrid = YES;
  _verticalGrid = YES;
  _grid = NO;
  _opacity = 1.0;
  _myPath=[[UIBezierPath alloc]init];
  _myPath.lineCapStyle=kCGLineCapRound;
  _myPath.miterLimit=0;
  _myPath.lineWidth=5;
  brushPattern=[UIColor redColor];
  first = YES;
  
  return self;
}

@synthesize horizontalGrid = _horizontalGrid;
@synthesize verticalGrid = _verticalGrid;
@synthesize grid   = _grid;
@synthesize opacity = _opacity;
@synthesize spikeTape = _spikeTape;
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// TODO this is in both Mainview drawRect and StageEditor drawRect which is bad practice, simplify to function
// that can be abstracted to make different shapes
- (void)drawRect:(CGRect)rect
{
  CGContextRef context = UIGraphicsGetCurrentContext();

    
  
  // Stage Drawing
  
  CGContextBeginPath(context);
  CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 10, [UIColor blackColor].CGColor);
  CGContextMoveToPoint(context, 50,25);
  CGContextAddLineToPoint(context, 974, 25);
  CGContextAddLineToPoint(context, 974, 550);
  CGContextAddArcToPoint(context, 512,700, 50,550, 1500);
  CGContextAddLineToPoint(context, 50, 550);
  
  CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
  CGContextFillPath(context);
  
  CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 10, [UIColor clearColor].CGColor);

  CGContextBeginPath(context);
  CGContextSetLineWidth(context, 2.0);
  CGContextSetAlpha(context, _opacity);
  CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
  

  
  if(_grid){
    // Horizontal Grid
    if(_horizontalGrid){
      for(int i =0; i<764; i+=40){
        CGContextMoveToPoint(context, 0, i);
        CGContextAddLineToPoint(context, 1024, i);
        
      }
    }
    //Vertical Grid
    if(_verticalGrid){
      for(int i=0; i<1024; i+= 40){
        CGContextMoveToPoint(context, i, 0);
        CGContextAddLineToPoint(context, i, 768);
      }
    }
  }
  CGContextStrokePath(context);
  
  [brushPattern setStroke];
  [_myPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
  
  
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  if(_spikeTape){
    if(first){
      first = NO;
      UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
      [_myPath moveToPoint:[mytouch locationInView:self]];
    }
    else{
      first = YES;
      UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
      [_myPath addLineToPoint:[mytouch locationInView:self]];
      [self setNeedsDisplay];
    }
  }
}



@end