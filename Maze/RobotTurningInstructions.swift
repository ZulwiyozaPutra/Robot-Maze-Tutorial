//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation
import GameKit

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(_ robot: ComplexRobotObject) {

        let randomBool = GKRandomSource.sharedRandom().nextBool()
        
        print("randomlyRotateRightOrLeft: \(randomBool)")
        
        switch randomBool {
        case true:
            robot.rotateRight()
        default:
            robot.rotateLeft()
        }
    }
    
    func continueStraightOrRotate(_ robot: ComplexRobotObject, wallInfo:(up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        let randomBool = GKRandomSource.sharedRandom().nextBool()
        
        print("continueStraightOrRotate: \(randomBool)")
        switch randomBool {
        case true:
            robot.move()
        default:
            turnTowardClearPath(robot, wallInfo: checkWalls(robot))
        }
        // You may want to paste your Part 1 implementation of continueStraightOrRotate(robot: ComplexRobotObject) here.
        
        // Step 3.2
        // TODO: Instead of calling randomlyRotateRightOrLeft() call turnTowardClearPath() when the robot has randomly chosen to rotate.
    }

    func turnTowardClearPath(_ robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        
        // Tell the robot which way to turn toward the clear path. There are four cases where the robot should rotate to the right (the first two have been done for you--uncomment the code below). Write the remaining two cases where the robot should rotate to the right. For all other cases, the robot should rotate to the left.
        if robot.direction == .left && wallInfo.down {
            robot.rotateRight()
        } else if robot.direction == .up && wallInfo.left {
            robot.rotateRight()
        } else if robot.direction == .right && wallInfo.up {
            robot.rotateRight()
        } else if robot.direction == .down && wallInfo.left {
            robot.rotateRight()
        } else {
            randomlyRotateRightOrLeft(robot)
        }
    }
}
