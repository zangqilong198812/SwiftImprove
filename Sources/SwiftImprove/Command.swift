import Foundation

/// 命令协议，用于统一实现 app 加载需要执行的方法
public protocol Command {
    /// 执行命令
    func execute()
}

/// 命令管理器，用于管理和执行命令
public class CommandManager {
    private var commands: [Command] = []
    
    public init() {}
    
    /// 添加命令
    /// - Parameter command: 要添加的命令
    public func add(_ command: Command) {
        commands.append(command)
    }
    
    /// 执行所有命令
    public func executeAll() {
        commands.forEach { $0.execute() }
    }
    
    /// 清空所有命令
    public func clear() {
        commands.removeAll()
    }
} 
