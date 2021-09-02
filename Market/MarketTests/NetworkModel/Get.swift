//
//  GetItem.swift
//  MarketTests
//
//  Created by 강경 on 2021/09/02.
//

import XCTest
@testable import Market

extension MarketNetworkModelTest {
    
    func testGet_성공하는_경우() {
        // given
        setRequestHandler(shouldSuccess: true)
        // when
        marketAPIProvider?.getData(apiRequestType: .loadProduct(id: 1)) { result in
            switch result {
            // then
            case .success:
                XCTAssert(true)
            case .failure:
                XCTFail("Test fail!!")
            }
            self.testExpectation?.fulfill()
        }
        
        if let expectation = testExpectation {
            wait(for: [expectation], timeout: 5)
        }
    }
    func testGet_실패하는_경우() {
        // given
        setRequestHandler(shouldSuccess: false)
        // when
        marketAPIProvider?.getData(apiRequestType: .loadProduct(id: 1)) { result in
            switch result {
            // then
            case .success:
                XCTFail("Test fail!!")
            case .failure:
                XCTAssert(true)
            }
            self.testExpectation?.fulfill()
        }
        
        if let expectation = testExpectation {
            wait(for: [expectation], timeout: 5)
        }
    }
}
