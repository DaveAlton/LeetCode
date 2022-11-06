import Foundation
import CoreGraphics

//You are given an n x n grid representing a field of cherries, each cell is one of three possible integers.
//
//0 means the cell is empty, so you can pass through,
//1 means the cell contains a cherry that you can pick up and pass through, or
//-1 means the cell contains a thorn that blocks your way.
//Return the maximum number of cherries you can collect by following the rules below:
//
//Starting at the position (0, 0) and reaching (n - 1, n - 1) by moving right or down through valid path cells (cells with value 0 or 1).
//After reaching (n - 1, n - 1), returning to (0, 0) by moving left or up through valid path cells.
//When passing through a path cell containing a cherry, you pick it up, and the cell becomes an empty cell 0.
//If there is no valid path between (0, 0) and (n - 1, n - 1), then no cherries can be collected.
//
//
//Example 1:
//
//
//Input: grid = [[0,1,-1],[1,0,-1],[1,1,1]]
//Output: 5
//Explanation: The player started at (0, 0) and went down, down, right right to reach (2, 2).
//4 cherries were picked up during this single trip, and the matrix becomes [[0,1,-1],[0,0,-1],[0,0,0]].
//Then, the player went left, up, up, left to return home, picking up one more cherry.
//The total number of cherries picked up is 5, and this is the maximum possible.
//Example 2:
//
//Input: grid = [[1,1,-1],[1,-1,1],[-1,1,1]]
//Output: 0
//
//
//Constraints:
//
//n == grid.length
//n == grid[i].length
//1 <= n <= 50
//grid[i][j] is -1, 0, or 1.
//grid[0][0] != -1
//grid[n - 1][n - 1] != -1

public class Solution741 {
    public init() {}

    enum Constants {
        static var pickedUp = 0
        static var blocked  = -1
    }

    var thereMemo = [Point: Int]()
    var backMemo = [Point: Int]()

    func inverse(grid oldGrid: [[Int]]) -> [[Int]] {
        var newGrid = [[Int]]()
        for row in oldGrid {
            newGrid.insert(row.reversed(), at: 0)
        }
        return newGrid
    }

    public func cherryPickup(_ grid: [[Int]], fromPoint point: Point = Point.zero, firstTimeThrough: Bool = true) -> Int {
        var pickedUpGrid = grid

        // Check if we've already been down this path
        if firstTimeThrough, let cherries = thereMemo[point] {
            return cherries
        }
        if !firstTimeThrough, let cherries = backMemo[point] {
            return cherries
        }

        // Check if we're out of bounds
        guard
            point.row >= 0,
            point.col >= 0,
            point.row < grid.count,
            point.col < (grid.first?.count ?? 0)
        else { return Constants.blocked }

        let cherries = grid[point.row][point.col]

        // Check if we're blocked
        if cherries == Constants.blocked {
            return Constants.blocked
        }

        pickedUpGrid[point.row][point.col] = Constants.pickedUp
        print(pickedUpGrid)

        // Check if we've reached the end
        if point.row == pickedUpGrid.count - 1 && point.col == (pickedUpGrid.first?.count ?? 0) - 1 {
            if firstTimeThrough {
                print("go back")
                return cherries + cherryPickup(inverse(grid: pickedUpGrid), firstTimeThrough: false)
            }
            print("finished")
            return cherries
        }

        let right = cherryPickup(pickedUpGrid, fromPoint: Point(row: point.row, col: point.col + 1))
        let down = cherryPickup(pickedUpGrid, fromPoint: Point(row: point.row + 1, col: point.col))

        let solution = max(right, down) + cherries
        if firstTimeThrough {
            thereMemo[point] = solution
        } else {
            backMemo[point] = solution
        }
        return solution
    }
}
