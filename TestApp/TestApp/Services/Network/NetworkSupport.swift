//
//  NetworkSupport.swift
//  TestApp
//
//  Created by Елена Воронцова on 15.12.2023.
//

import Foundation

protocol Request {
    
    associatedtype Response = [String: Any]
    
    var path: URL { get }
    
    func decode(with data: Data, decoder: JSONDecoder) throws -> Response
}



