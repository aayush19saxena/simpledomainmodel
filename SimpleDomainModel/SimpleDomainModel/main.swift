//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    switch to {
    case "USD":
        switch self.currency {
        case "GBP":
            return Money(amount: Int(self.amount * 2), currency: "USD")
        case "CAN":
            return Money(amount: Int(self.amount * 4/5), currency: "USD")
        case "EUR":
            return Money(amount: Int(self.amount * 2/3), currency: "USD")
        default: return self
        }
    case "GBP":
        switch self.currency {
        case "USD":
            return Money(amount: Int(self.amount * 1/2), currency: "GBP")
        case "CAN":
            return Money(amount: Int(self.amount * 2/5), currency: "GBP")
        case "EUR":
            return Money(amount: Int(self.amount * 1/3), currency: "GBP")
        default: return self
        }
    case "CAN":
        switch self.currency {
        case "USD":
            return Money(amount: Int(self.amount * 5/4), currency: "CAN")
        case "GBP":
            return Money(amount: Int(self.amount * 5/2), currency: "CAN")
        case "EUR":
            return Money(amount: Int(self.amount * 5/6), currency: "CAN")
        default: return self
        }
    case "EUR":
        switch self.currency {
        case "USD":
            return Money(amount: Int(self.amount * 3/2), currency: "EUR")
        case "GBP":
            return Money(amount: Int(self.amount * 3), currency: "EUR")
        case "CAN":
            return Money(amount: Int(self.amount * 6/5), currency: "EUR")
        default: return self
        }
    default: return self
    }
  }
  
  public func add(_ to: Money) -> Money {
    return Money(amount: self.convert(to.currency).amount + to.amount, currency: to.currency)
  }
  public func subtract(_ from: Money) -> Money {
    return Money(amount: self.amount - from.convert(self.currency).amount, currency: self.currency)
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}





