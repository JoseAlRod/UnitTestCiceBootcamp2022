//
//  UnitTestPresenterTests.swift
//  UnitTestCiceBootcamp2022Tests
//
//  Created by Jose Alberto on 9/3/22.
//

import XCTest
@testable import UnitTestCiceBootcamp2022

class UnitTestPresenterTests: XCTestCase {

    // Subjeto Bajo Prueba -> Subject Under Test
    var presenter: UnitTestPresenter!
    
    override func setUp() {
        // Inicializa todas las instancias del objeto de prueba
        print(#function, "<-- ZZZ")
        presenter = UnitTestPresenter()
    }
    
    override func tearDown() {
        // Elimina las instancias por cada test que se ejecuta
        print(#function, "<--- YYY")
        presenter = nil
    }
    
    func test_UnitTestPresenter_NotNil() {
        print(#function, "<-- AAA")
        XCTAssertNotNil(presenter)
    }
    
    // Nombre del método / status bajo prueba / comportamiento esperado
    func test_Sumar_InputCorrecto_OK_Result() {
        // 1 -> Arrange / GIVEN
        let resultExpected = 11
        let result: Int
        // 2 -> Action / WHEN
        result = presenter.sumar(numero1: 7, numero2: 4)
        // 3 -> Assert / THEN
        XCTAssertEqual(resultExpected, result)
    }
    
    func test_Restar_InputCorrecto_OK_Result() {
        let resultExpected = 3
        let result: Int
        result = presenter.restar(numero1: 7, numero2: 4)
        XCTAssertEqual(resultExpected, result)
    }
    
    func test_Restar_InputCorrecto_Two_OK_Result() {
        let resultExpected = -10
        let result: Int
        result = presenter.restar(numero1: 10, numero2: 20)
        XCTAssertEqual(resultExpected, result)
    }
    
    func test_Dividir_InputCorrecto_OK_Result() {
        XCTAssertEqual(3, presenter.dividir(numero1: 6, numero2: 2))
    }
    
    func test_Dividir_InputIncorrecto_OK_Result() {
        XCTAssertEqual(3, try presenter.dividirCero(numero1: 6, numero2: 2))
        XCTAssertThrowsError(try presenter.dividirCero(numero1: 4, numero2: 0))
    }
    
    func test_Array_Square_Option_One_Result() {
        var numbers = [Int]()
        for index in 1...4 {
            numbers.append(index)
        }
        let numberSquare = presenter.arraySquareOptionOne(numberArray: numbers)
        
        var resultExpected = [Int]()
        resultExpected.append(1)
        resultExpected.append(4)
        resultExpected.append(9)
        resultExpected.append(16)
        XCTAssertEqual(resultExpected, numberSquare)
    }
    
    func test_Array_Square_Option_Two_Result() {
        var numbers = [Int]()
        for index in 1...4 {
            numbers.append(index)
        }
        let numberSquare = presenter.arraySquareOptionTwo(numberArray: numbers)
        
        var resultExpected = [Int]()
        resultExpected.append(1)
        resultExpected.append(4)
        resultExpected.append(9)
        resultExpected.append(16)
        XCTAssertEqual(resultExpected, numberSquare)
    }
    
    func test_Array_Square_Option_Three_Result() {
        var numbers = [Int]()
        for index in 1...4 {
            numbers.append(index)
        }
        let numberSquare = presenter.arraySquareOptionThree(numberArray: numbers)
        
        var resultExpected = [Int]()
        resultExpected.append(1)
        resultExpected.append(4)
        resultExpected.append(9)
        resultExpected.append(16)
        XCTAssertEqual(resultExpected, numberSquare)
    }
    
    func test_Assert_Types() {
        XCTAssertTrue(1 == 1)
        XCTAssertFalse(1 == 2)
        XCTAssertNil(nil)
        XCTAssertNotNil(self.presenter)
        XCTAssertEqual(self.presenter.sumar(numero1: 2, numero2: 2), 4)
        XCTAssertEqual("Jose", "Jose")
        XCTAssertGreaterThan(10, 1)
    }
    
    func test_Performance_Sut_Dividir() {
        self.measure {
            self.presenter.dividir(numero1: 4, numero2: 2)
        }
    }
    
    func test_Performance_Array_Square_Option_One() {
        var numbers = [Int]()
        for index in 1...50000000 {
            numbers.append(index)
        }
        self.measure {
            self.presenter.arraySquareOptionOne(numberArray: numbers)
        }
    }
    
    func test_Performance_Array_Square_Option_Two() {
        var numbers = [Int]()
        for index in 1...50000000 {
            numbers.append(index)
        }
        self.measure {
            self.presenter.arraySquareOptionTwo(numberArray: numbers)
        }
    }
    
    func test_Performance_Array_Square_Option_Three() {
        var numbers = [Int]()
        for index in 1...50000000 {
            numbers.append(index)
        }
        self.measure {
            self.presenter.arraySquareOptionThree(numberArray: numbers)
        }
    }
    
    func test_Performance_toFah_One_Result() {
        let expectedResult: Double = -9.4
        let result = self.presenter.toFath(degreeUnit: -23)
        XCTAssertEqual(expectedResult, result, accuracy: 0.001)
        self.measure {
            result
        }
    }
    
    func test_Performance_toFah_Two_Result() {
        let expectedResult: Double = -9.4
        let result = self.presenter.toFathTwo(degreeUnit: -23)
        XCTAssertEqual(expectedResult, result, accuracy: 0.001)
        self.measure {
            result
        }
    }



}
