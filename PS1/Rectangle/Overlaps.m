//
//  Overlaps.m
//  
//  CS3217 || Assignment 1
//  Name: Chen Weiguang
//

#import <Foundation/Foundation.h>
#import "PEShape.h"

// definition of Rectangle struct
typedef struct rectangle_t {
	
	int origin_x;
	int origin_y;
	
	int width;
	int height;
	
} Rectangle;


// checks for whether the test point is within 2 other points
// note that because points given are always from the same axis
// so the points are not really points, but rather points with one of its dimension stripped off
// return 1 for true, 0 for false
int test_point_within_two_points(int test_point, int point1, int point2) {
	
	if (test_point < point1 || test_point > point2)
		return 0;
	
	return 1;
}


// EFFECTS: returns 1 if rectangles overlap and 0 otherwise
int overlaps(Rectangle * rectangle1, Rectangle * rectangle2) {

	// all the corner points for rectangle1
	int rectangle1_top_left_x = rectangle1->origin_x;
	int rectangle1_top_left_y = rectangle1->origin_y;
	
	int rectangle1_top_right_x = rectangle1->origin_x + rectangle1->width;
	int rectangle1_top_right_y = rectangle1->origin_y;
	
	int rectangle1_bottom_left_x = rectangle1->origin_x;
	int rectangle1_bottom_left_y = rectangle1->origin_y + rectangle1->height;
	
	int rectangle1_bottom_right_x = rectangle1->origin_x + rectangle1->width;
	int rectangle1_bottom_right_y = rectangle1->origin_y + rectangle1->height;
	
	// all the corner points for rectangle2
	int rectangle2_top_left_x = rectangle2->origin_x;
	int rectangle2_top_left_y = rectangle2->origin_y;
	
	int rectangle2_top_right_x = rectangle2->origin_x + rectangle2->width;
	int rectangle2_top_right_y = rectangle2->origin_y;
	
	int rectangle2_bottom_left_x = rectangle2->origin_x;
	int rectangle2_bottom_left_y = rectangle2->origin_y + rectangle2->height;
	
	int rectangle2_bottom_right_x = rectangle2->origin_x + rectangle2->width;
	int rectangle2_bottom_right_y = rectangle2->origin_y + rectangle2->height;
	
	// test for whether rectangle1 resides/overlaps with rectangle2 first
	// by testing the corners from rectangle1
	// in fact, just testing the top corners is enough because rectangle2 will be tested as well
	
	// top left corner
	if (test_point_within_two_points(rectangle1_top_left_x, rectangle2_top_left_x, rectangle2_top_right_x) &&
		test_point_within_two_points(rectangle1_top_left_y, rectangle2_top_left_y, rectangle2_bottom_left_y))
		
		return 1;
	
	// top right corner
	if (test_point_within_two_points(rectangle1_top_right_x, rectangle2_top_left_x, rectangle2_top_right_x) &&
		test_point_within_two_points(rectangle1_top_right_y, rectangle2_top_right_y, rectangle2_bottom_right_y))
		
		return 1;
	
	// test for whether rectangle2 resides/overlaps with rectangle1
	// by testing the corners from rectangle2
	// just testing the top corners is enough
	
	// top left corner
	if (test_point_within_two_points(rectangle2_top_left_x, rectangle1_top_left_x, rectangle1_top_right_x) &&
		test_point_within_two_points(rectangle2_top_left_y, rectangle1_top_left_y, rectangle1_bottom_left_y))
		
		return 1;
	
	// top right corner
	if (test_point_within_two_points(rectangle2_top_right_x, rectangle1_top_left_x, rectangle1_top_right_x) &&
		test_point_within_two_points(rectangle2_top_right_y, rectangle1_top_right_y, rectangle1_bottom_right_y))
		
		return 1;
	
	// otherwise, there is no intersection
	// so return false
	return 0;
}


// main function
int main (int argc, const char * argv[]) {
	
	/* Problem 1 code (C only!) */
	// declare rectangle 1 and rectangle 2
	Rectangle * rectangle1 = (Rectangle *)malloc(sizeof(Rectangle));
	Rectangle * rectangle2 = (Rectangle *)malloc(sizeof(Rectangle));

	// input origin for rectangle 1
	printf("Input <x y> coordinates for the origin of the first rectangle: ");
	scanf("%d%d", &rectangle1->origin_x, &rectangle1->origin_y);
	
	// input size (width and height) for rectangle 1
	printf("Input width and height of the first rectangle: ");
	scanf("%d%d", &rectangle1->width, &rectangle1->height);
	
	// input origin for rectangle 2
	printf("Input <x y> coordinates for the origin of the second rectangle: ");
	scanf("%d%d", &rectangle2->origin_x, &rectangle2->origin_y);
	
	// input size (width and height) for rectangle 2
	printf("Input width and height of the second rectangle: ");
	scanf("%d%d", &rectangle2->width, &rectangle2->height);

	// check if overlapping and write message
	if (overlaps(rectangle1, rectangle2))
		printf("The two rectangles are overlapping!\n");
	else
		printf("The two rectangles are not overlapping!\n");


	/* Problem 2 code (Objective-C) */
	// declare rectangle 1 and rectangle 2 objects

	// input rotation for rectangle 1

	// input rotation for rectangle 2

	// rotate rectangle objects
	
	// check if rectangle objects overlap and write message

	// clean up
	free(rectangle1);
	free(rectangle2);

	// exit program
	return 0;
}

// This is where you should put your test cases to test that your implementation is correct. 
int test() {
  // EFFECTS: returns 1 if all test cases are successfully passed and 0 otherwise

}

/* 

Question 2(h)
========

<Your answer here>



Question 2(i): Reflection (Bonus Question)
==========================
(a) How many hours did you spend on each problem of this problem set?

<Your answer here>

(b) In retrospect, what could you have done better to reduce the time you spent solving this problem set?

<Your answer here>

(c) What could the CS3217 teaching staff have done better to improve your learning experience in this problem set?

<Your answer here>

*/
