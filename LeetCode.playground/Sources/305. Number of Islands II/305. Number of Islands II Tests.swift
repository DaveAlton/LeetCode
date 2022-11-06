import Foundation

public class Solution305Tests {
    public init() {
        testExample()
        testTwoAddsOneIsland()
        testTwoSeparateIslands()
        testNoIslands()
    }

    func testExample() {
        let solution = Solution305().addLand(toGrid: [[0,0,0],[0,0,0],[0,0,0]], atPoints: [Point(row: 0, col: 0), Point(row: 0, col: 1), Point(row: 1, col: 2), Point(row: 2, col: 1)]) == 3
        print(solution)
    }

    func testTwoAddsOneIsland() {
        let solution = Solution305().addLand(toGrid: [[0,0,0],[0,0,0],[0,0,0]], atPoints: [Point(row: 0, col: 0), Point(row: 0, col: 1)]) == 1
        print(solution)
    }

    func testTwoSeparateIslands() {
        let solution = Solution305().addLand(toGrid: [[0,0,0],[0,0,0],[0,0,0]], atPoints: [Point(row: 0, col: 0), Point(row: 0, col: 2)]) == 2
        print(solution)
    }

    func testNoIslands() {
        let solution = Solution305().addLand(toGrid: [[0,0,0],[0,0,0],[0,0,0]], atPoints: []) == 0
        print(solution)
    }
}

