//
//  Tests.swift
//
//  Copyright (c) 2015-2016 Evgeny Aleksandrov. License: MIT.

import Quick
import Nimble
import Nimble_Snapshots
import EARestrictedScrollView

class RestrictedScrollSpec: QuickSpec {
    override func spec() {
        describe("RestrictedScroll") {
            var scrollView: EARestrictedScrollView!
            
            func addViewOutline(_ frame: CGRect) {
                let restrictionArea = UIView(frame: frame)
                restrictionArea.layer.cornerRadius = 10
                restrictionArea.layer.borderColor = UIColor.white.cgColor
                restrictionArea.layer.borderWidth = 2
                
                scrollView.addSubview(restrictionArea)
            }
            
            beforeEach {
                scrollView = EARestrictedScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
                
                let imageView = UIImageView(image: UIImage(named: "milky-way"))
                scrollView.addSubview(imageView)
                scrollView.contentSize = imageView.frame.size
            }
            
            it("should look as expected") {
                expect(scrollView).notTo(beNil())
                expect(scrollView).to(haveValidDeviceAgnosticSnapshot(named: "InitState"))
            }
            
            it("should move offset to restrictionArea.origin") {
                let restrictionArea = CGRect(x: 300, y: 300, width: 300, height: 300)
                scrollView.restrictionArea = restrictionArea
                addViewOutline(restrictionArea)
                
                expect(scrollView.alignedOffset.x).to(beCloseTo(restrictionArea.origin.x))
                expect(scrollView.alignedOffset.y).to(beCloseTo(restrictionArea.origin.y))
                
                expect(scrollView).to(haveValidDeviceAgnosticSnapshot(named: "SmallRestrictionArea"))
                
                scrollView.restrictionArea = CGRect.zero
                
                expect(scrollView.alignedOffset.x).to(beCloseTo(restrictionArea.origin.x))
                expect(scrollView.alignedOffset.y).to(beCloseTo(restrictionArea.origin.y))
            }
            
            it("should not change offset that is inside restrictionArea") {
                let contentOffset = CGPoint(x: 400, y: 400)
                scrollView.contentOffset = contentOffset
                
                let restrictionArea = CGRect(x: 300, y: 300, width: 500, height: 500)
                scrollView.restrictionArea = restrictionArea
                addViewOutline(restrictionArea)
                
                expect(scrollView.alignedOffset.x).to(beCloseTo(contentOffset.x))
                expect(scrollView.alignedOffset.y).to(beCloseTo(contentOffset.y))
                
                scrollView.restrictionArea = CGRect.zero
                
                expect(scrollView.alignedOffset.x).to(beCloseTo(contentOffset.x))
                expect(scrollView.alignedOffset.y).to(beCloseTo(contentOffset.y))
            }
        }
    }
}
