//
//  ExProtocolTests.swift
//  ExProtocolTests
//
//  Created by 소하 on 2023/02/09.
//

import XCTest
@testable import ExProtocol

final class ExProtocolTests: XCTestCase {
    var divider:DivideMoney!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        divider = DivideMoney()
    }

    override func tearDownWithError() throws {
        divider = nil
        try super.tearDownWithError()
    }

    // 결과값 확인
    func testCalculate() throws {
        // given
        let total = 50003
        let people = 5
        divider.enterData(moeny: total, count: people)
        // when
        let money = divider.calculate()
        let other = divider.remain()
        // then
        XCTAssertEqual(money * people + other, total)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
