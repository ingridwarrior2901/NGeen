//
// Protocols.swift
// Copyright (c) 2014 NGeen
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

// MARK: ApiQuery delegate

@objc protocol ApiQueryDelegate: NSObjectProtocol {
    
    optional func cachedResponseForUrl(url: NSURL, cachedData data: AnyObject)
    
}

// MARK: Cache delegate

@objc protocol CacheDelegate: NSObjectProtocol {
    
    func cache(cache: Cache, writeFileWithName name: String, data: NSPurgeableData)
    func cache(cache: Cache, deleteFileWithName name: String, andKey key: String)
    
}

// MARK: Configurable Store protocol

@objc protocol ConfigurableStoreProtocol: NSObjectProtocol {
    
    var configurations: [String: ConfigurationStoreProtocol] { get }
    
    func configuration(forServer server: String) -> ConfigurationStoreProtocol
    func setConfiguration(configuration: ConfigurationStoreProtocol, forServer server: String)
    
}

// MARK: Configuration Store protocol

@objc protocol ConfigurationStoreProtocol: NSObjectProtocol {
    
}

// MARK: Query protocol

@objc protocol QueryProtocol: NSObjectProtocol {
    
    var config: ConfigurationStoreProtocol { get set }
    //var data: Dictionary<String, AnyObject> { get set }
    //var fields: Array<String> { get set }
    //var limit: Int { get set }
    //var offset: Int { get set }
    //var predicate: NSPredicate? { get set }
    
    //func addField(field: String)
    //func dataForKey(key: String)
    //func setData(data: AnyObject, forKey key: String)
}

// MARK: ResponseSerializer protocol

@objc protocol ResponseSerializerProtocol: NSObjectProtocol {
    
    func responseObjectForData(data: NSData, urlResponse: NSURLResponse?, error: NSError?) -> AnyObject?
    
}

// MARK: SessionTask delegate

@objc protocol SessionDelegate: NSObjectProtocol {
    
    optional func cachedResponseForUrl(url: NSURL, cachedData data: NSData)
}

// MARK: Store config

protocol StoreProtocol: NSObjectProtocol {
    
    func createQuery() -> QueryProtocol
    func createQueryWithConfigurationKey(key: String) -> QueryProtocol
    func createQueryForPath(path: String, httpMethod method: HttpMethod) -> QueryProtocol
    func createQueryForPath(path: String, httpMethod method: HttpMethod, server name: String) -> QueryProtocol

}