import UIKit
import XCPlayground

// iPhone 6 Screen size
let SCREEN_WIDTH = 375.0
let SCREEN_HEIGHT = 667.0

func DegreesToRadians(degrees: Double) -> CGFloat {
    return CGFloat(degrees / 180.0 * M_PI)
}

let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
XCPShowView("view", view: view)

/*:
# Core Animation Programming Guide
Core Animation is a graphics rendering and animation infrastructure available on both iOS and OS X that you use to animate the views and other visual elements of your app. With Core Animation, most of the work required to draw each frame of an animation is done for you. All you have to do is configure a few animation parameters (such as the start and end points) and tell Core Animation to start. Core Animation does the rest, handing most of the actual drawing work off to the onboard graphics hardware to accelerate the rendering. This automatic graphics acceleration results in high frame rates and smooth animations without burdening the CPU and slowing down your app.

This playground is meant to be a visual companion to Apple's [Core Animation Programming Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html)
*/

/*:
## UIView Animations
Before we get to the details of core animation it's important to mention that a lot of animations can be accomplished by simply using the UIView animation methods. The UIView animations provides you easy access to animate the following properties:

* frame
* bounds
* center
* transform
* alpha
* backgroundColor
* contentStretch

For more details see the [View Programming Guide for iOS](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/AnimatingViews/AnimatingViews.html)
*/

//: ### Starting Animations Using the Block-Based Methods

#if false
let blockView = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
blockView.backgroundColor = UIColor.redColor()
view.addSubview(blockView)

UIView.animateWithDuration(2.0) {
    blockView.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
}
#endif

//: ### Starting Animations Using the Begin/Commit Methods

#if false
let blockView = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
blockView.backgroundColor = UIColor.redColor()
view.addSubview(blockView)

UIView.beginAnimations("Rotate", context: nil)
UIView.setAnimationCurve(.Linear)
UIView.setAnimationDuration(1.0)

blockView.transform = CGAffineTransformMakeRotation(DegreesToRadians(180))

UIView.commitAnimations()
#endif

//: ### Linking Multiple Animations Together

#if false
let blockView = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
blockView.backgroundColor = UIColor.redColor()
view.addSubview(blockView)

UIView.animateWithDuration(2.0,
    delay: 1.0,
    usingSpringWithDamping: 0.5,
    initialSpringVelocity: 0.5,
    options: .CurveEaseOut,
    animations: { () -> Void in
        blockView.frame = CGRect(x: 20, y: 20, width: 50, height: 50)

        UIView.animateWithDuration(1.0,
            delay: 0.0,
            options: .CurveLinear,
            animations: { () -> Void in
                blockView.transform = CGAffineTransformMakeRotation(DegreesToRadians(180))
            },
            completion: { (finished) -> Void in

            })
    },
    completion: { (finished) -> Void in

    })
#endif

/*:
## Core Animation Basics

Every `UIView` is backed by a `CALayer` object. Layers provide infrastructure for your views. Specifically, layers make it easier and more efficient to draw and animate the contents of views and maintain high frame rates while doing so. However, there are many things that layers do not do. Layers do not handle events, draw content, participate in the responder chain, or do many other things.

### Layer Objects Define Their Own Geometry

Layers make use of both point-based coordinate systems and unit coordinate systems to specify the placement of content. Which coordinate system is used depends on the type of information being conveyed. Point-based coordinates are used when specifying values that map directly to screen coordinates or must be specified relative to another layer, such as for the layer’s `position` property. Unit coordinates are used when the value should not be tied to screen coordinates because it is relative to some other value. For example, the layer’s `anchorPoint` property specifies a point relative to the bounds of the layer itself, which can change.

Among the most common uses for point-based coordinates is to specify the size and position of the layer, which you do using the layer’s `bounds` and `position` properties. The `bounds` defines the coordinate system of the layer itself and encompasses the layer’s size on the screen. The `position` property defines the location of the layer relative to its parent’s coordinate system. Although layers have a `frame` property, that property is actually derived from the values in the `bounds` and `position` properties and is used less frequently.
*/

#if false
#if false
let imageView = UIImageView(image: UIImage(named: "automator"))
view.addSubview(imageView)
#endif

//: ![](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Art/layer_coords_anchorpoint_position_2x.png "")

#if false
print(imageView.layer.anchorPoint)
imageView.layer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
#endif

//: ![](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Art/layer_coords_anchorpoint_transform_2x.png "")

#if false
imageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
imageView.layer.anchorPoint = CGPoint(x: 0.0, y: 0.0)
imageView.layer.anchorPoint = CGPoint(x: 1.0, y: 1.0)

imageView.layer.transform = CATransform3DMakeRotation(DegreesToRadians(90), 0.0, 0.0, 1.0);
#endif
#endif

//: ## Setting Up Layer Objects

//: ### Using an Image for the Layer’s Content

#if false
#if false
view.backgroundColor = UIColor.whiteColor()
let imageLayer = CALayer()
imageLayer.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 100.0)
imageLayer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
imageLayer.contents = UIImage(named: "automator")?.CGImage
imageLayer.contentsGravity = kCAGravityResize
view.layer.addSublayer(imageLayer)
#endif

//: ### Layers Have Their Own Background and Border

#if false
imageLayer.backgroundColor = UIColor.blueColor().CGColor
imageLayer.borderColor = UIColor.redColor().CGColor
imageLayer.borderWidth = 4.0
#endif

//: ### Layers Support a Corner Radius

#if false
imageLayer.cornerRadius = 10.0
#endif

//: ### Layers Support Built-In Shadows

#if false
imageLayer.shadowColor = UIColor.blackColor().CGColor
imageLayer.shadowOpacity = 0.5
imageLayer.shadowOffset = CGSize(width: 10.0, height: 10.0)
imageLayer.shadowRadius = 5.0
#endif
#endif

//: ### Different Kinds of Layers
//: There are different `CALayer` subclasses that can be used that each do different things. Below are a few of the more common ones.

//: CAShapeLayer

#if false
let shapeLayer = CAShapeLayer()
shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
shapeLayer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
shapeLayer.backgroundColor = UIColor.whiteColor().CGColor
shapeLayer.borderColor = UIColor.greenColor().CGColor
shapeLayer.borderWidth = 1.0

#if false
let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 50, height: 50),
    cornerRadius: 5.0)
#endif

#if false
let path = UIBezierPath(arcCenter: CGPoint(x: 50.0, y: 50.0),
    radius: 20.0,
    startAngle: DegreesToRadians(0),
    endAngle: DegreesToRadians(360),
    clockwise: true)
#endif

#if false
let path = UIBezierPath()
path.moveToPoint(CGPoint(x: 50.0, y: 0.0))
path.addLineToPoint(CGPoint(x: 100.0, y: 40.0))
path.addLineToPoint(CGPoint(x: 80.0, y: 100.0))
path.addLineToPoint(CGPoint(x: 20.0, y: 100.0))
path.addLineToPoint(CGPoint(x: 0.0, y: 40.0))
path.closePath()

shapeLayer.path = path.CGPath
shapeLayer.strokeColor = UIColor.redColor().CGColor
shapeLayer.lineWidth = 5.0
shapeLayer.fillColor = UIColor.blueColor().CGColor
shapeLayer.lineDashPattern = [5,3]

view.layer.addSublayer(shapeLayer)
#endif
#endif

//: CATextLayer

#if false
let textLayer = CATextLayer()
textLayer.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
textLayer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
textLayer.backgroundColor = UIColor.whiteColor().CGColor
textLayer.string = "I'm a layer! This text is long."
textLayer.font = "Cochin"
textLayer.fontSize = 20.0
textLayer.wrapped = true
textLayer.alignmentMode = kCAAlignmentCenter
textLayer.truncationMode = kCATruncationEnd
textLayer.foregroundColor = UIColor.blackColor().CGColor

view.layer.addSublayer(textLayer)
#endif

//: CAGradientLayer

#if false
let gradientLayer = CAGradientLayer()
gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH, height: 200.0)
gradientLayer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
gradientLayer.backgroundColor = UIColor.whiteColor().CGColor
gradientLayer.colors = [UIColor.redColor().CGColor, UIColor.greenColor().CGColor, UIColor.blueColor().CGColor]
gradientLayer.locations = [0.2, 0.5, 0.8]

gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

view.layer.addSublayer(gradientLayer)
#endif

//: ### Masking Layers

#if false
let squareLayer = CALayer()
squareLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
squareLayer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
squareLayer.backgroundColor = UIColor.redColor().CGColor
view.layer.addSublayer(squareLayer)

let RING_WIDTH: CGFloat = 30.0
let ringLayer = CALayer()
ringLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
ringLayer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
ringLayer.backgroundColor = UIColor.blueColor().CGColor
view.layer.addSublayer(ringLayer)

let mask = CAShapeLayer()
mask.frame = ringLayer.frame
mask.position = CGPoint(x: 150.0, y: 150.0)

let path = UIBezierPath(arcCenter: CGPoint(x: 150.0, y: 150.0),
    radius: (150.0 - (RING_WIDTH/2)),
    startAngle: DegreesToRadians(0),
    endAngle: DegreesToRadians(360),
    clockwise: true)

mask.path = path.CGPath
mask.strokeColor = UIColor.redColor().CGColor
mask.lineWidth = RING_WIDTH
mask.fillColor = UIColor.clearColor().CGColor
mask.lineDashPattern = [10,5]

ringLayer.mask = mask
#endif

//: ## Animating Layer Content

//: ### Animating Simple Changes to a Layer’s Properties

#if false
#if false
let layer = CALayer()
layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
layer.position = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2)
layer.backgroundColor = UIColor.redColor().CGColor
view.layer.addSublayer(layer)
#endif

//: Implicit animation
//: This doesn't display well in Playgrounds but setting properties like `opacity` or `bounds` of a layer have implicit animations associated with them. You can use the `CATransaction` class to tweak the default animation duration. Additionally sometimes when setting layer properties and using explicit animations you might want change some properties before you're animations and don't need the default transactions. In that case doe you can disable the default animations.

#if false
CATransaction.begin()
CATransaction.disableActions()
layer.opacity = 1.0
CATransaction.commit()
#endif

//: Explicit animation

#if false
let fadeAnimation = CABasicAnimation(keyPath: "opacity")
fadeAnimation.fromValue = NSNumber(double: 1.0)
fadeAnimation.toValue = NSNumber(double: 0.0)
fadeAnimation.duration = 3.0
layer.addAnimation(fadeAnimation, forKey: "opacityAnimation")
#endif

//: Change the actual data value in the layer to the final value otherwise you'll see it snap back to the original state

#if false
layer.opacity = 0.0;
#endif

//: ### Using a Keyframe Animation to Change Layer Properties

#if false
let path = CGPathCreateMutable()
CGPathMoveToPoint(path, nil, CGFloat(SCREEN_WIDTH/2), CGFloat(SCREEN_HEIGHT/2))
CGPathAddLineToPoint(path, nil, 50, 50)
CGPathAddLineToPoint(path, nil, 300, 200)
CGPathAddLineToPoint(path, nil, CGFloat(50.0), CGFloat(SCREEN_HEIGHT - 50.0))
CGPathAddLineToPoint(path, nil, CGFloat(SCREEN_WIDTH/2), CGFloat(SCREEN_HEIGHT/2))

let keyframeAnimation = CAKeyframeAnimation(keyPath: "position")
keyframeAnimation.path = path
keyframeAnimation.duration = 4.0
keyframeAnimation.keyTimes = [0.0, 0.2, 0.5, 0.55, 1.0]
keyframeAnimation.repeatCount = .infinity
//keyframeAnimation.rotationMode = kCAAnimationRotateAuto
layer.addAnimation(keyframeAnimation, forKey: "keyframe animation")
#endif

//: Don't forget to update your property to the final value. In this case we end up where we started from so there's no need to change the `position` property of the layer

//: ### Stopping an Explicit Animation While It Is Running

#if false
layer.removeAnimationForKey("keyframe animation")
layer.removeAllAnimations()
#endif

//: ### Animating Multiple Changes Together

#if false
let widthAnimation = CAKeyframeAnimation(keyPath: "borderWidth")
widthAnimation.values = [1.0, 10.0, 5.0, 30.0, 0.5, 15.0, 2.0, 50.0, 0.0]
widthAnimation.calculationMode = kCAAnimationPaced

let colorAnimation = CAKeyframeAnimation(keyPath: "borderColor")
colorAnimation.values = [UIColor.greenColor().CGColor, UIColor.whiteColor().CGColor, UIColor.blueColor().CGColor]
colorAnimation.calculationMode = kCAAnimationPaced

let group = CAAnimationGroup()
group.animations = [widthAnimation, colorAnimation]
group.duration = 5.0

layer.addAnimation(group, forKey: "BorderChanges")
#endif
#endif

/*:
### Rules for Modifying UIView Layers in iOS
Because iOS views always have an underlying layer, the `UIView` class itself derives most of its data from the layer object directly. As a result, changes you make to the layer are automatically reflected by the view object as well. This behavior means that you can use either the Core Animation or `UIView` interfaces to make your changes.

If you want to use Core Animation classes to initiate animations, you must issue all of your Core Animation calls from inside a view-based animation block. The `UIView` class disables layer animations by default but reenables them inside animation blocks. So any changes you make outside of an animation block are not animated. The code below shows an example of how to change a layer’s opacity implicitly and its position explicitly. In this example, the myNewPosition variable is calculated beforehand and captured by the block. Both animations start at the same time but the opacity animation runs with the default timing while the position animation runs with the timing specified in its animation object.
*/

#if false
let myView = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
myView.backgroundColor = UIColor.blueColor()
view.addSubview(myView)

let myNewPosition = CGPoint(x: 50, y: 500)

UIView.animateWithDuration(3.0) {
    myView.layer.opacity = 0.0
    
    let theAnim = CABasicAnimation(keyPath: "position")
    theAnim.fromValue = NSValue(CGPoint: myView.layer.position)
    theAnim.toValue = NSValue(CGPoint: myNewPosition)
    theAnim.duration = 1.0
    myView.layer.addAnimation(theAnim, forKey: "AnimateFrame")
}

myView.layer.position = myNewPosition
#endif

/*:
If you are using constraint-based layout rules to manage the position of your views, you must remove any constraints that might interfere with an animation as part of configuring that animation. Constraints affect any changes you make to the position or size of a view. They also affect the relationships between the view and its child views. If you are animating changes to any of those items, you can remove the constraints, make the change, and then apply whatever new constraints are needed.
*/

//: ## Building a Layer Hierarchy

//: ## Advanced Animation Tricks



//: ## Changing a Layer's Default Behavior

//: ## Improving Animation Performance

//: ## Creating a Custom Control

#if false
class GlowButton: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.size.height/2
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

let button = GlowButton(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
button.backgroundColor = UIColor.blueColor()

view.addSubview(button)
#endif
