import XCTest
import SwiftUI
@testable import SwiftImprove

final class ColorExtensionTests: XCTestCase {
    func testHexColorInitialization() {
        let color1 = Color(hex: "#FF0000")
        let color2 = Color(hex: "00FF00")
        let color3 = Color(hex: "0000FF")
        
        XCTAssertNotNil(color1)
        XCTAssertNotNil(color2)
        XCTAssertNotNil(color3)
    }
    
    func testRGBColorInitialization() {
        let color = Color(rgb: 255, green: 0, blue: 0)
        XCTAssertNotNil(color)
    }
} 