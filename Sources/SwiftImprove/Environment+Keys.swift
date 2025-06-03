//
//  Environment+Keys.swift
//  IntestinalTractDoctor
//
//  Created by zang qilong on 2025/5/12.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
private extension UIEdgeInsets {
    
    var edgeInsets: EdgeInsets {
        .init(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
#endif

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        #if os(iOS) || os(tvOS)
        let keyWindow = UIApplication.shared.topWindow
        return keyWindow?.safeAreaInsets.edgeInsets ?? EdgeInsets()
        #else
        EdgeInsets()
        #endif
    }
}

public extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}
