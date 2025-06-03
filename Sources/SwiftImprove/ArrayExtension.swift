import Foundation

public extension Array {
    /// 将数组分割成指定大小的块
    /// - Parameter size: 每个块的大小
    /// - Returns: 包含子数组的数组
    func chunk(size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
    
    /// 安全地获取数组元素
    /// - Parameter index: 索引
    /// - Returns: 如果索引有效则返回元素，否则返回 nil
    func safeGet(at index: Int) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
    
    /// 移除数组中的重复元素，保持原有顺序
    /// - Returns: 去重后的数组
    func unique() -> [Element] where Element: Hashable {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
    
    func withIndex() -> [(Int, Element)] {
        return zip(self.indices, self).reduce(into: [(Int, Element)]()) { result, element in
            result.append(element)
        }
    }
    
    mutating func moveElement(from n: Int, to m: Int) {
        // 检查索引是否有效
        guard indices.contains(n) && indices.contains(m) else {
            print("Error: 索引超出范围")
            return
        }
        
        // 移除元素并保存
        let element = self.remove(at: n)
        // 插入元素到新位置
        self.insert(element, at: m)
    }
}
