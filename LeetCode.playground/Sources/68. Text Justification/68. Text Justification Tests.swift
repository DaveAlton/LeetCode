import Foundation

public class Solution68Tests {
    public init() {
        testExample1()
        testExample2()
        testExample3()
    }

    func testExample1() {
        let solution = Solution68().fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16) == ["This    is    an", "example  of text", "justification.  "]
        print(solution)
    }

    func testExample2() {
        let solution = Solution68().fullJustify(["What","must","be","acknowledgment","shall","be"], 16) == ["What   must   be", "acknowledgment  ", "shall         be"]
        print(solution)
    }

    func testExample3() {
        let solution = Solution68().fullJustify(["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], 20) == ["Science  is  what we", "understand      well", "enough to explain to", "a  computer.  Art is", "everything  else  we", "do                  "]
        print(solution)
    }
}
