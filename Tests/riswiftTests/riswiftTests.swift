import XCTest
@testable import riswift

var risfile: String? = nil

let firstCite = "\r\nTY  - JOUR\r\nTI  - THE RULE OF LAW AND EQUALITY\r\nAU  - GOWDER, PAUL\r\nAB  - [This paper describes and defends a novel and distinctively egalitarian conception of the rule of law. Official behavior is to be governed by preexisting, public rules that do not draw irrelevant distinctions between the subjects of law. If these demands are satisfied, a state achieves vertical equality between officials and ordinary people and horizontal legal equality among ordinary people.]\r\nC1  - Full publication date: September 2013\r\nDB  - JSTOR\r\nEP  - 618\r\nIS  - 5\r\nPB  - Springer\r\nPY  - 2013\r\nSN  - 01675249, 15730522\r\nSP  - 565\r\nT2  - Law and Philosophy\r\nUR  - http://www.jstor.org/stable/24572415\r\nVL  - 32\r\nER  -"

final class riswiftTests: XCTestCase {
    override class func setUp() { // 1.
        super.setUp()
        risfile = try? String(contentsOfFile: "Tests/riswiftTests/data/valid.ris")
    }
    
    func testFileReadable() {
        XCTAssertNotNil(risfile)
    }
    
    func testCanExtractCitesFromValidFile() {
        let firstExtractedCite = extractValidBlocks(risdata: risfile!)![0]
        XCTAssertEqual(firstExtractedCite, firstCite)
    }
    func testInclusiveRegexMatching() {
        let dummyString = "cat101"
        let longDummyString = "cat101meowmeow"
        XCTAssertTrue(dummyString.matches(#"cat\d\d\d"#))
        XCTAssertFalse(dummyString.matches(#"dog\d\d\d"#))
        XCTAssertTrue(longDummyString.matches(#"cat\d\d\d"#))
    }
    func testCompleteRegexMatching() {
        let dummyString = "cat101"
        let longDummyString = "cat101meowmeow"
        XCTAssertTrue(dummyString.completelyMatches(#"cat\d\d\d"#))
        XCTAssertTrue(dummyString.completelyMatches(Regex(#"cat\d\d\d"#)))
        XCTAssertFalse(dummyString.completelyMatches(Regex(#"dog\d\d\d"#)))
        XCTAssertFalse(longDummyString.completelyMatches(#"cat\d\d\d"#))
        XCTAssertTrue(RPValidator("IN FILE"))
        XCTAssertTrue(RPValidator("ON REQUEST 02/01/80"))
        XCTAssertFalse(RPValidator("ON REQUEST 02/01/801"))
    }
}

#if os(Linux)
extension TodoTests {
	static var allTests = [
			("testFileReadable", testFileReadable),
		]
	}

#endif 
