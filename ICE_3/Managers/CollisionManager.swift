//
//  CollisionManager.swift
//  ICE_2
//
//  Created by Murtaza Haider Naqvi on 2023-02-05.
//

import GameplayKit
import SpriteKit

class CollisionManager{
    
    public static var GameViewController : GameViewController?
    
    public static func SquaredDistance(point1:CGPoint, point2: CGPoint) -> CGFloat{
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject){
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfWidth!
        let P2Radius = object2.halfWidth!
        let Radii = P1Radius + P2Radius
        
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii){
            if(!object2.isColliding!){
                switch(object2.name)
                {
                case "island":
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    print("colliding with island")
                    break
                case "cloud":
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    print("colliding with cloud")
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
