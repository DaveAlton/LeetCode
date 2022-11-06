//305. Number of Islands II
//A 2d grid map of m rows and n columns is initially filled with water. We may perform an addLand operation which turns the water at position (row, col) into a land. Given a list of positions to operate, count the number of islands after each addLand operation. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
//Example:
//
//Input: m = 3, n = 3, positions = [[0,0], [0,1], [1,2], [2,1]]
//Output: [1,1,2,3]
//Explanation:
//
//Initially, the 2d grid grid is filled with water. (Assume 0 represents water and 1 represents land).
//
//0 0 0
//0 0 0
//0 0 0
//Operation #1: addLand(0, 0) turns the water at grid[0][0] into a land.
//
//1 0 0
//0 0 0   Number of islands = 1
//0 0 0
//Operation #2: addLand(0, 1) turns the water at grid[0][1] into a land.
//
//1 1 0
//0 0 0   Number of islands = 1
//0 0 0
//Operation #3: addLand(1, 2) turns the water at grid[1][2] into a land.
//
//1 1 0
//0 0 1   Number of islands = 2
//0 0 0
//Operation #4: addLand(2, 1) turns the water at grid[2][1] into a land.
//
//1 1 0
//0 0 1   Number of islands = 3
//0 1 0
//Follow up:
//
//Can you do it in time complexity O(k log mn), where k is the length of the positions?

import Foundation

public class Solution305 {
    enum Constants {
        static let island = 1
    }

    var islandIdForPoint = [Point: UUID]()
    var uniqueIslandIds: Int {
        Set(islandIdForPoint.values).count
    }

    public init() {}

    public func addLand(toGrid grid: [[Int]], atPoints points: [Point]) -> Int {
        var grid = grid
        for point in points {
            grid = addLand(toGrid: grid, atPoint: point)
        }
        return uniqueIslandIds
    }

    func addLand(toGrid grid: [[Int]], atPoint point: Point) -> [[Int]] {
        let id = UUID()
        islandIdForPoint[point] = id
        var grid = grid
        grid[point.row][point.col] =  Constants.island
        updateIslandIds(onGrid: grid, fromPoint: point, withId: id)
        return grid
    }

    func updateIslandIds(onGrid grid: [[Int]], fromPoint point: Point, withId id: UUID, updatedMemo: [Point: Bool] = [Point: Bool]()) {
        var updatedMemo = updatedMemo
        guard updatedMemo[point] != true else { return }

        // check if the point is within the grid, and the point is an island
        guard grid.indices.contains(point.row),
              grid.first?.indices.contains(point.col) == true,
              grid[point.row][point.col] ==  Constants.island else { return }

        islandIdForPoint[point] = id
        updatedMemo[point] = true

        updateIslandIds(onGrid: grid, fromPoint: Point(row: point.row + 1, col: point.col), withId: id, updatedMemo: updatedMemo)
        updateIslandIds(onGrid: grid, fromPoint: Point(row: point.row - 1, col: point.col), withId: id, updatedMemo: updatedMemo)
        updateIslandIds(onGrid: grid, fromPoint: Point(row: point.row, col: point.col + 1), withId: id, updatedMemo: updatedMemo)
        updateIslandIds(onGrid: grid, fromPoint: Point(row: point.row, col: point.col - 1), withId: id, updatedMemo: updatedMemo)
    }
}
