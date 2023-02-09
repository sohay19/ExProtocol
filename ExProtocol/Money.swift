//
//  Money.swift
//  ExProtocol
//
//  Created by 소하 on 2023/02/09.
//

import Foundation

protocol MoneyProtocol {
    var totalMoney:Int { get }
    var count:Int { get }
    // 데이터 입력
    func enterData(moeny:Int, count:Int)
    // 계산 로직
    func calculate() -> Int
    // 남은 금액
    func remain() -> Int
    // 결과 출력
    func printResult() -> String
}


class DivideMoney : MoneyProtocol {
    var totalMoney: Int = 0
    var count: Int = 0
    
    func enterData(moeny: Int, count: Int) {
        totalMoney = moeny
        self.count = count
    }
    
    func calculate() -> Int {
        return totalMoney / count
    }
    
    func remain() -> Int {
        return totalMoney - calculate() * count
    }
    
    func printResult() -> String {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        guard let totalMoney = numFormatter.string(from: NSNumber(value: totalMoney)),
        let result = numFormatter.string(from: NSNumber(value: calculate())) else { return "" }
        var msg = ""
        msg = "총 금액 : \(totalMoney)원\n인원 : \(count)명\n1명당 내야할 금액 : \(result)원"
        if remain() != 0 {
            guard let other = numFormatter.string(from: NSNumber(value: remain())) else { return "" }
            msg += "\n나머지 금액 : \(other)원"
        }
        return msg
    }
}


class GatherMoney : MoneyProtocol {
    var totalMoney: Int = 0
    var count: Int = 0
    
    func enterData(moeny: Int, count: Int) {
        totalMoney = moeny
        self.count = count
    }
    
    func calculate() -> Int {
        return totalMoney / count
    }
    
    func remain() -> Int {
        return totalMoney - calculate() * count
    }
    
    func printResult() -> String {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        var msg = ""
        guard let totalMoney = numFormatter.string(from: NSNumber(value: totalMoney)),
        let result = numFormatter.string(from: NSNumber(value: calculate())) else { return "" }
        msg = "총 기간 : \(count)개월\n총 금액 : \(totalMoney)원"
        if remain() == 0 {
            msg += "\n\(count)개월간 내야할 금액 : \(result)원"
        } else {
            guard let other = numFormatter.string(from: NSNumber(value: calculate() + remain())) else { return "" }
            msg += "\n\(count-1)개월간 내야할 금액 : \(result)원\n마지막 달에 내야할 금액 : \(other)원"
        }
        return msg
    }
}
