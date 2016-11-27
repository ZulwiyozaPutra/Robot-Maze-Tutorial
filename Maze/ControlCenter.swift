//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
    // You may want to paste your Part 2 implementation of moveComplexRobot() here
        
        //Create an instance of boolean of isFacingWall
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        // Step 2.1c
        // TODO: Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(myRobot)
        
        // Categorize the robot's current location based on the number of walls
        let isThreeWayJunction = myWallInfo.numberOfWalls == 1
        let isTwoWayPath = myWallInfo.numberOfWalls == 2
        let isDeadEnd = myWallInfo.numberOfWalls == 3
        
        
        //Creating wall inforamation into an array of bool so it will checkable by a siwtch statement
        let wallInfos: [Bool] = [isThreeWayJunction, isTwoWayPath, isDeadEnd]
        
        for wallInfo in wallInfos {
            if wallInfo {
                switch wallInfo {
                case isThreeWayJunction:
                    if robotIsBlocked {
                        randomlyRotateRightOrLeft(myRobot)
                        print("this is three way junction and robot is blocked")
                    } else if !robotIsBlocked {
                        continueStraightOrRotate(myRobot, wallInfo: checkWalls(myRobot))
                        print("this is three way junction and robot is not blocked")
                    }
                case isTwoWayPath:
                    if robotIsBlocked {
                        randomlyRotateRightOrLeft(myRobot)
                        print("this is two way path and robot is blocked")
                    } else if !robotIsBlocked {
                        myRobot.move()
                        print("this is two way path and robot is not blocked")
                    }
                default:
                    if robotIsBlocked {
                        myRobot.rotateRight()
                        print("this is dead end and robot is blocked")
                    } else if !robotIsBlocked {
                        myRobot.move()
                        print("this is dead end and robot is not blocked")
                    }
                }
            }
        }


        
        // Step 3.2
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}
