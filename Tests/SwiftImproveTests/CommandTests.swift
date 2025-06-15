import XCTest
@testable import SwiftImprove

final class CommandTests: XCTestCase {
    class MockCommand: Command {
        var executed = false
        func execute() {
            executed = true
        }
    }
}
