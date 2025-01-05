//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Marius Cristescu on 05.01.2025.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init (client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(url: URL(string: "https://example.com")!)
    }
}

protocol HTTPClient {
    func get(url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doeNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
