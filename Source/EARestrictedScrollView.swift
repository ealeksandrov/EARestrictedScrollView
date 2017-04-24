//
//  EARestrictedScrollView.swift
//
//  Copyright (c) 2015-2016 Evgeny Aleksandrov. License: MIT.

import UIKit

open class EARestrictedScrollView: UIScrollView {
    
    /// Container to hold all subviews of scrollview.
    lazy fileprivate var containerView: UIView = self.createContainerView()
    
    /// Helper func, since direct use of `super` call in `lazy` causes compile error.
    func createContainerView() -> UIView {
        let view = UIView()
        super.addSubview(view)
        return view
    }
    
    /// Affects `restrictionArea.size` and `containerView.frame.size` when set.
    override open var contentSize: CGSize {
        get {
            return super.contentSize
        }
        set(newContentSize) {
            containerView.frame = CGRect(origin: containerView.frame.origin, size: newContentSize)
            restrictionArea = CGRect(origin: restrictionArea.origin, size: newContentSize)
        }
    }
    
    /// Recalculated `contentOffset` in coordinate space of `containerView`.
    open var alignedOffset: CGPoint {
        get {
            let originalOffset = super.contentOffset
            let newOffset = CGPoint(x: originalOffset.x + restrictionArea.origin.x, y: originalOffset.y + restrictionArea.origin.y)
            
            return newOffset
        }
        set(newContentOffset) {
            let newOffset = CGPoint(x: newContentOffset.x - restrictionArea.origin.x, y: newContentOffset.y - restrictionArea.origin.y)
            
            super.contentOffset = newOffset
        }
    }
    
    /// Defines restriction area in coordinate space of `containerView`. Use CGRectZero to reset restriction.
    open var restrictionArea: CGRect = CGRect.zero {
        didSet {
            if restrictionArea == CGRect.zero {
                super.contentOffset = CGPoint(x: super.contentOffset.x - containerView.frame.origin.x, y: super.contentOffset.y - containerView.frame.origin.y)
                containerView.frame = CGRect(origin: CGPoint.zero, size: containerView.frame.size)
                super.contentSize = containerView.frame.size
            } else {
                containerView.frame = CGRect(origin: CGPoint(x: -restrictionArea.origin.x, y: -restrictionArea.origin.y), size: containerView.frame.size)
                super.contentOffset = CGPoint(x: super.contentOffset.x - restrictionArea.origin.x, y: super.contentOffset.y - restrictionArea.origin.y)
                super.contentSize = restrictionArea.size
            }
        }
    }
    
    /// Leads to `containerView.subviews` - all subviews except scroll indicators are stored there.
    open var containedSubviews: [UIView] {
        return containerView.subviews
    }
    
    // MARK: - Subviews functions override
    
    override open func addSubview(_ view: UIView) {
        if subviews.count < 3 && isItScrollIndicator(view) {
            super.addSubview(view)
        } else {
            containerView.addSubview(view)
        }
    }
    
    override open func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
        containerView.insertSubview(view, aboveSubview: siblingSubview)
    }
    
    override open func insertSubview(_ view: UIView, at index: Int) {
        containerView.insertSubview(view, at: index)
    }
    
    override open func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) {
        containerView.insertSubview(view, belowSubview: siblingSubview)
    }
    
    override open func bringSubview(toFront view: UIView) {
        if view.superview == self {
            super.bringSubview(toFront: view)
        } else {
            containerView.bringSubview(toFront: view)
        }
    }
    
    override open func sendSubview(toBack view: UIView) {
        if view.superview == self {
            super.sendSubview(toBack: view)
        } else {
            containerView.sendSubview(toBack: view)
        }
    }
    
    // MARK: - Private
    
    /// Checks if a view is a scroll indicator of `UIScrollView`.
    fileprivate func isItScrollIndicator(_ view: UIView) -> Bool {
        return ((showsHorizontalScrollIndicator && view.frame.height == 2.5) || (showsVerticalScrollIndicator && view.frame.width == 2.5)) && view is UIImageView
    }
}
