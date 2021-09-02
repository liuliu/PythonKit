import XCTest
import PythonKit
import Foundation

class DateConversionTests: XCTestCase {
    static var datetimeModule = try? Python.attemptImport("datetime")

    func testDateConversion() {
        guard let datetime = DateConversionTests.datetimeModule else { return }
        let date = datetime.datetime(2020, 10, 10)
        let swiftDate = Date(date)
        XCTAssertEqual(swiftDate.pythonObject, date)
        let notDate = Date(Int(10).pythonObject)
        XCTAssertNil(notDate)
    }
}
