import XCTest
@testable import JWTMiddlewareTests

extension JWTMiddlewareTests {
static var allTests = [
  ("testNothing", testNothing),
]
}


XCTMain([
  testCase(JWTMiddlewareTests.allTests),
])
