import Foundation

public class Solution741Tests {
    public init() {
//        testExample()
//        testOneCherry()
//        testTwoCherriesOneRow()
//        testTwoCherriesTwoRows()
        testGoesBack()
    }

    func testExample() {
        let solution = Solution741().cherryPickup([[0,1,-1],[1,0,-1],[1,1,1]])
        print(solution == 5)
    }

    func testOneCherry() {
        let solution = Solution741().cherryPickup([[1]])
        print(solution == 1)
    }

    func testTwoCherriesOneRow() {
        let solution = Solution741().cherryPickup([[1,1]])
        print(solution == 2)
    }

    func testTwoCherriesTwoRows() {
        let solution = Solution741().cherryPickup([[1],[1]])
        print(solution == 2)
    }

    func testTwoChoices() {
        let solution = Solution741().cherryPickup([[1,0],[1,1]])
        print(solution == 3)
    }

    func testEmpty() {
        let solution = Solution741().cherryPickup([])
        print(solution == -1)
    }

    func testGoesDownTwoLanes() {
        let solution = Solution741().cherryPickup([[1,0],[1,1]])
        print(solution == 3)
    }

    func testGoesBack() {
        let solution = Solution741().cherryPickup([[1,1],[1,1]])
        print(solution == 4)
    }
}

