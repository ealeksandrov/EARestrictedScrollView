import XCTest
import FBSnapshotTestCase
@testable import EARestrictedScrollView

class EARestrictedScrollViewTests: FBSnapshotTestCase {

    private var scrollView: EARestrictedScrollView!

    override func setUp() {
        super.setUp()

        // switch between generating and verifying of test snapshots
        recordMode = false

        scrollView = EARestrictedScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

        let imageView = UIImageView(image: UIImage(named: "milky-way"))
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.frame.size
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initial_state_looks_as_expected() {
        XCTAssertNotNil(scrollView)
        FBSnapshotVerifyView(scrollView)
    }

    func test_scroll_view_moves_offset_inside_restriction_area() {
        // Given
        let initialContentOffset = scrollView.contentOffset
        let restrictionArea = CGRect(x: 300, y: 300, width: 300, height: 300)
        addViewOutline(restrictionArea)

        // When
        scrollView.restrictionArea = restrictionArea

        // Then
        XCTAssertFalse(restrictionArea.contains(initialContentOffset))
        XCTAssertEqual(scrollView.alignedOffset, restrictionArea.origin)
        FBSnapshotVerifyView(scrollView)

        // When
        scrollView.restrictionArea = CGRect.zero

        // Then
        XCTAssertEqual(scrollView.alignedOffset, restrictionArea.origin)
    }

    func test_scroll_view_keeps_offset_inside_restriction_area() {
        // Given
        let initialContentOffset = CGPoint(x: 400, y: 400)
        scrollView.contentOffset = initialContentOffset

        let restrictionArea = CGRect(x: 300, y: 300, width: 500, height: 500)
        addViewOutline(restrictionArea)

        // When
        scrollView.restrictionArea = restrictionArea

        // Then
        XCTAssertTrue(restrictionArea.contains(initialContentOffset))
        XCTAssertEqual(scrollView.alignedOffset, initialContentOffset)

        // When
        scrollView.restrictionArea = CGRect.zero

        // Then
        XCTAssertEqual(scrollView.alignedOffset, initialContentOffset)
    }
}

private extension EARestrictedScrollViewTests {

    func addViewOutline(_ frame: CGRect) {
        let restrictionArea = UIView(frame: frame)
        restrictionArea.layer.cornerRadius = 10
        restrictionArea.layer.borderColor = UIColor.white.cgColor
        restrictionArea.layer.borderWidth = 2

        scrollView.addSubview(restrictionArea)
    }
}
