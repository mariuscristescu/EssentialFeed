//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Marius Cristescu on 05.01.2025.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClientSpy.shared.get(url: URL(string: "https://example.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    func get(url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doeNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
