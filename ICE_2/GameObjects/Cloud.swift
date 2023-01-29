
import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    //initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5
        Reset()
    }
    override func Update() {
        Move()
        CheckBounds()
    }
    override func CheckBounds() {
        if(position.y <= -902)
        {
            Reset()
        }
    }
    override func Reset()
    {
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        horizonatalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        
        position.y = CGFloat(randomY)
        isColliding = false
    }
    func Move()
    {
        position.x -= horizonatalSpeed!
        position.y -= verticalSpeed!
    }
}
