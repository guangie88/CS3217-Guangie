//
//  PERectangle.m
//  
//  CS3217 || Assignment 1
//  Name: Chen Weiguang
//

#import "PERectangle.h"
#import <math.h>

@implementation PERectangle
// OVERVIEW: This class implements a rectangle and the associated
//             operations.

// property area
@synthesize CGPoint origin;
@synthesize CGFloat width, height, rotation;
	
- (CGPoint)center {
	// EFFECTS: returns the coordinates of the centre of mass for this
	// rectangle.

	// first, get the top-left coordinates
	CGPoint originPoint = [self cornerFrom:kTopLeftCorner];
	
	// now we get the distance between the top-left origin point and the centre of mass
	// Pythagoras' Theorem would be applied here
	// this distance will be known as diagonalToCenter
	
	CGFloat halfWidth = self.width / 2;
	CGFloat halfHeight = self.height / 2;
	CGFloat diagonalToCenter = sqrt(halfWidth * halfWidth + halfHeight * halfHeight);
	
	// next, we find the angle from the line along width (horizontal line)
	// to the line connecting to the center of mass
	// this angle will be called angleToCenter
	
	CGFloat angleToCenter = atan(halfHeight / halfWidth);
	
	// using some rotation formula
	// we will use all the previously computed result
	// to get the rotated center of mass value
	// basically just breaking down and calculating the new x and y components
	
	CGPoint rotatedCenter;
	
	rotatedCenter.x = originPoint.x + diagonalToCenter * cos(angle + self.rotation);
	rotatedCenter.y = originPoint.y + diagonalToCenter * sin(angle + self.rotation);
	
	return rotatedCenter;
}

- (CGPoint)cornerFrom:(CornerType)corner {
  // REQUIRES: corner is a enum constant defined in PEShape.h as follows:
  //           kTopLeftCorner, kTopRightCorner, kBottomLeftCorner,
  //		   kBottomRightCorner 
  // EFFECTS: returns the coordinates of the specified rotated rectangle corner 

}

- (CGPoint*)corners {
  // EFFECTS:  return an array with all the rectangle corners

  CGPoint *corners = (CGPoint*) malloc(4*sizeof(CGPoint));
  corners[0] = [self cornerFrom: kTopLeftCorner];
  corners[1] = [self cornerFrom: kTopRightCorner];
  corners[2] = [self cornerFrom: kBottomRightCorner];
  corners[3] = [self cornerFrom: kBottomLeftCorner];
  return corners;
}

- (id)initWithOrigin:(CGPoint)o width:(CGFloat)w height:(CGFloat)h rotation:(CGFloat)r{
  // MODIFIES: self
  // EFFECTS: initializes the state of this rectangle with origin, width,
  //          height, and rotation angle in degrees

}

- (id)initWithRect:(CGRect)rect {
  // MODIFIES: self
  // EFFECTS: initializes the state of this rectangle using a CGRect

}

- (void)rotate:(CGFloat)angle {
  // MODIFIES: self
  // EFFECTS: rotates this shape counter-clockwise by the specified angle
  // around the center of mass

}

- (void)translateX:(CGFloat)dx Y:(CGFloat)dy {
  // MODIFIES: self
  // EFFECTS: translates this shape by the specified dx (along the
  //            X-axis) and dy coordinates (along the Y-axis)

}

- (BOOL)overlapsWithShape:(id<PEShape>)shape {
  // EFFECTS: returns YES if this shape overlaps with specified shape.
  
  if ([shape class] == [PERectangle class]) {
    return [self overlapsWithRect:(PERectangle *)shape];
  }

  return NO;
}

- (BOOL)overlapsWithRect:(PERectangle*)rect {
  // EFFECTS: returns YES if this shape overlaps with specified shape.
  // <add missing code here>

}

- (CGRect)boundingBox {	
  // EFFECTS: returns the bounding box of this shape.

  // optional implementation (not graded)
  return CGRectMake(INFINITY, INFINITY, INFINITY, INFINITY);
}

@end

