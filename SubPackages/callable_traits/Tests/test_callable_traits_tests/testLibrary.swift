import XCTest
@testable import test_callable_traits

class test_callable_traits_tests: XCTestCase {
	func testMemberThing() throws {
		XCTAssertEqual(main(), 0)
	}
}