//
//  File.swift
//  
//
//  Created by zang qilong on 2023/3/18.
//

import Foundation
import AudioToolbox
import UIKit

public enum Vibration: Int, CaseIterable {
  case error = 1
  case success
  case warning
  case light
  case medium
  case heavy
  case soft
  case rigid
  case selection
  case oldSchool
  
  public func vibrate() {
    switch self {
    case .error:
      UINotificationFeedbackGenerator().notificationOccurred(.error)
    case .success:
      UINotificationFeedbackGenerator().notificationOccurred(.success)
    case .warning:
      UINotificationFeedbackGenerator().notificationOccurred(.warning)
    case .light:
      UIImpactFeedbackGenerator(style: .light).impactOccurred()
    case .medium:
      UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    case .heavy:
      UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    case .soft:
      UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    case .rigid:
      UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
    case .selection:
      UISelectionFeedbackGenerator().selectionChanged()
    case .oldSchool:
      AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
  }
  
  var caseName: String {
    return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
  }
}
