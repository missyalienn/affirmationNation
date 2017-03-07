//
//  CalcBrain.swift
//  Converty
//
//  Created by Missy Allan on 3/3/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation


func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

class CalcBrain {
    
    private var accumulator = 0.0
    func setOperand(operand: Double) {
     accumulator = operand
    
    }
    
    var operations : [String: Operation ] = [
    "π": Operation.Constant(M_PI),
    "e": Operation.Constant(M_E),
    "√": Operation.UnaryOperation(sqrt),
    "cos": Operation.UnaryOperation(cos),
    "×": Operation.BinaryOperation(multiply),
    "=": Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String ) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let associatedConstantValue): accumulator = associatedConstantValue
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):break
            case .Equals: break
       
                 
            }
       }
    }

    private var pending: BinaryOperationInfo?
    struct BinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
        
    }
    
    
    var result: Double {
        get {
            return accumulator
        }
    }

}



