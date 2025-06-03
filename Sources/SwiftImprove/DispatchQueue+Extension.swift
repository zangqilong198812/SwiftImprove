//
//  DispatchQueue+Extension.swift
//  EasyBudget
//
//  Created by zang qilong on 2024/11/29.
//

import Foundation

public func delayExecute(delay: TimeInterval, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: completion)
}

public func executeOnMain(completion: @escaping () -> Void) {
    DispatchQueue.main.async(execute: completion)
}
