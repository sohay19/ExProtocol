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
    
    func enterData(moeny:Int, count:Int)
    
    func calculate() -> Int
    
    func remain() -> Int
    
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
        return "총 금액 : \(totalMoney)원\n인원 : \(count)명\n1명당 내야할 금액 : \(calculate())원\n나머지 금액 : \(remain())원"
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
        var msg = ""
        var result = 0
        var other = 0
        result = calculate()
        msg = "총 기간 : \(count)개월\n총 금액 : \(totalMoney)원"
        if remain() == 0 {
            msg += "\n\(count)개월간 내야할 금액 : \(result)원"
        } else {
            other = result + remain()
            msg += "\n\(count-1)개월간 내야할 금액 : \(result)원\n마지막 달에 내야할 금액 : \(other)원"
        }
        return msg
    }
}
