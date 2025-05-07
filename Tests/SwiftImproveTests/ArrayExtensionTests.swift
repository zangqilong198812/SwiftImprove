import XCTest
@testable import SwiftImprove

final class ArrayExtensionTests: XCTestCase {
    func testChunk() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8]
        let chunked = array.chunk(size: 3)
        
        XCTAssertEqual(chunked.count, 3)
        XCTAssertEqual(chunked[0], [1, 2, 3])
        XCTAssertEqual(chunked[1], [4, 5, 6])
        XCTAssertEqual(chunked[2], [7, 8])
    }
    
    func testSafeGet() {
        let array = [1, 2, 3, 4, 5]
        
        XCTAssertEqual(array.safeGet(at: 0), 1)
        XCTAssertEqual(array.safeGet(at: 4), 5)
        XCTAssertNil(array.safeGet(at: 5))
        XCTAssertNil(array.safeGet(at: -1))
    }
    
    func testUnique() {
        let array = [1, 2, 2, 3, 3, 3, 4, 5, 5]
        let unique = array.unique()
        
        XCTAssertEqual(unique, [1, 2, 3, 4, 5])
    }
} 
