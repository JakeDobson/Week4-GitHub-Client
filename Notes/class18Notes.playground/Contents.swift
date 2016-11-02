
import UIKit


                        /////// CLASS 18 \\\\\\
                        //////  11/01/16  \\\\\\



/*
 #NOTES:
 
 
 *** Animation in iOS ***
 
 * transition - smoothly animating from one visual state to the next helps the user understand what the app is doing
 * focus - direct the user's attention
 * delight
 
 ** Workflow **
 
 - initial properties of the item
 - final properties
 - how long
 - whats happening
 - what happens when done
 
 * Animated Properties *
    - postition/size/frame
    - opacity
    - scale
    - color
    - rotation
    - 3D transform
    - constraints
 
 
 *** Core Animation ***
 
 - in charge of all rendering on screen, not just animations
 - uses CALayer objects as its main unit of work. UIView objects are just thin wrapper's for CALayer's
 - layers can be arranged in a hierarchy just like UIView's, can build using layers only if you wanted to
 
 * techniques
    - adding CAAnimation and its subclasses to a layer
    - simple block/closure based system using class methods on UIView
    - key-frame animations, which is just a wrapper built around the lower level CAAnimation method. Uses block/closure syntax
 
 * spring animations
    -- type of motion being usee to generate a nice, springy-feeling animation is typically modeled after a damped harmonic oscillation
    -- key properties
        -> mass
        -> stiffness
        -> damping - restrictive force
 
 * key-frame animations
    -- start and stop at diff times, relative to on interval
    -- requires creation of a parent block that all the key-frmae animations are created in
    -- each key frame animation must be setup with a relative start/stop time
 
 
 
 *** Custom View Controller Transitions ***
 
 
 
 
 */