//
//  File.swift
//  SwiftImprove
//
//  Created by zang qilong on 6/15/25.
//

import Foundation

/// A type-erased codable wrapper.
public struct AnyCodable {
    
    public typealias Value = any Codable & Hashable
    
    public let value: Value
    
    /// Creates an instance that type-erases a value.
    public init(_ value: Value) {
        self.value = value
    }
}

// MARK: - Codable

extension AnyCodable: Codable {
    
    enum CodingKeys: CodingKey {
        case type
        case value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_mangledTypeName(type(of: value)), forKey: .type)
        try container.encode(value, forKey: .value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeName = try container.decode(String.self, forKey: .type)
        guard let type = _typeByName(typeName) as? any Codable.Type else {
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Could not decode type \(typeName)"
            )
        }
        guard let value = try container.decode(
            type, forKey: .value) as? Value else {
            throw DecodingError.dataCorruptedError(
                forKey: .value,
                in: container,
                debugDescription: "\(typeName) is not Codable & Hashable"
            )
        }
        self.value = value
    }
}

// MARK: - Hashable

extension AnyCodable: Hashable {
    
    public static func == (lhs: AnyCodable, rhs: AnyCodable) -> Bool {
        lhs.value.isEqual(to: rhs.value)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

// MARK: - Equatable

extension Equatable {
    
    func isEqual(to other: any Equatable) -> Bool {
        guard let other = other as? Self else {
            return false
        }
        return self == other
    }
}
