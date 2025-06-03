import Foundation

/// 命令协议，用于统一实现 app 加载需要执行的方法
public protocol Command {
    /// 执行命令
    func execute()
}
