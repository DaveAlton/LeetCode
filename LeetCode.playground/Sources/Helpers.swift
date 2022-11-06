import Foundation

public struct Point: Hashable {
    public var row: Int
    public var col: Int

    public init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }

    public static let zero = Point(row: 0, col: 0)
}
