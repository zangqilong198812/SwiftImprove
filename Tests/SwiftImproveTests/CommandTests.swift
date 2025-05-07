import XCTest
@testable import SwiftImprove

final class CommandTests: XCTestCase {
    class MockCommand: Command {
        var executed = false
        func execute() {
            executed = true
        }
    }
    
    func testCommandManager() {
        let manager = CommandManager()
        let command1 = MockCommand()
        let command2 = MockCommand()
        
        manager.add(command1)
        manager.add(command2)
        
        XCTAssertFalse(command1.executed)
        XCTAssertFalse(command2.executed)
        
        manager.executeAll()
        
        XCTAssertTrue(command1.executed)
        XCTAssertTrue(command2.executed)
        
        manager.clear()
    }
} 
