//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Marius Cristescu on 06.01.2025.
//

import Foundation

public protocol HTTPClient {
    func get(url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init (url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(url: url)
    }
}
