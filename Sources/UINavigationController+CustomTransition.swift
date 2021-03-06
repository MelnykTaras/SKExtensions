//
//  CATransition.swift
//
//  Created by Viktor Olesenko on 18.06.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

// MARK: - CATransitionType

public enum CATransitionType: RawRepresentable {
    case fade
    case moveIn
    case push
    case reveal
    
    public typealias RawValue = String
    
    public init?(rawValue: CATransitionType.RawValue) {
        switch rawValue {
        case kCATransitionFade:     self = .fade
        case kCATransitionMoveIn:   self = .moveIn
        case kCATransitionPush:     self = .push
        case kCATransitionReveal:   self = .reveal
        default: return nil
        }
    }
    
    public var rawValue: CATransitionType.RawValue {
        switch self {
        case .fade:     return kCATransitionFade
        case .moveIn:   return kCATransitionMoveIn
        case .push:     return kCATransitionPush
        case .reveal:   return kCATransitionReveal
        }
    }
}

// MARK: - CATransitionSubtype

public typealias CATransitionDirection = CATransitionSubtype

public enum CATransitionSubtype: RawRepresentable {
    case fromTop
    case fromLeft
    case fromBottom
    case fromRight
    
    public typealias RawValue = String
    
    public init?(rawValue: CATransitionType.RawValue) {
        switch rawValue {
        case kCATransitionFromTop:      self = .fromTop
        case kCATransitionFromLeft:     self = .fromLeft
        case kCATransitionFromBottom:   self = .fromBottom
        case kCATransitionFromRight:    self = .fromRight
        default: return nil
        }
    }
    
    public var rawValue: CATransitionType.RawValue {
        switch self {
        case .fromTop:      return kCATransitionFromTop
        case .fromLeft:     return kCATransitionFromLeft
        case .fromBottom:   return kCATransitionFromBottom
        case .fromRight:    return kCATransitionFromRight
        }
    }
}

// MARK: - UINavigationController

public extension UINavigationController {
    
    public func addTransition(transitionType type: CATransitionType, transitionDirection direction: CATransitionDirection) {
        let transition = CATransition()
        transition.duration = 0.35
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = type.rawValue
        transition.subtype = direction.rawValue
        
        self.view.layer.add(transition, forKey: nil)
    }

    public func pushViewControllerCustom(_ viewController: UIViewController) {
        self.addTransition(transitionType: .push, transitionDirection: .fromRight)
        self.pushViewController(viewController, animated: false)
    }
    
    public func popViewControllerCustom() {
        self.addTransition(transitionType: .push, transitionDirection: .fromLeft)
        self.popViewController(animated: false)
    }
}
