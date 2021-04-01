//
//  MovieLibraryTests.swift
//  MovieLibraryTests
//
//  Created by Elisa Camillo on 26/03/21.
//
import XCTest
import Alamofire
@testable import MovieLibrary

class MovieLibraryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    /* ------------------------------- */
    
    func testRetrieveTrendingMovies() {
        
        // source: https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations
        
        let expectation = XCTestExpectation(description: "Initial request to the Movie Database API")

        let api_key: String = "a3627ac6d1cea57a39a026d0d83a6a0a"
        
        let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(api_key)&language=pt-BR")!

        AF.request(url)
            .response { data in
                XCTAssertNotNil(data, "No data was downloaded")
                expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2000.0)

    }
    

}
