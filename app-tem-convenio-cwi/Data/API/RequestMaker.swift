//
//  RequestMaker.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class RequestMaker {
    
    static let decoder = JSONDecoder()
    
    var baseUrl: String
    
    init() {
        self.baseUrl = "https://tem-convenio-cwi.firebaseio.com/"
    }
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    let session = URLSession.shared
    typealias RequestResult<T> = Result<T, RequestMakerError>
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, withParams params: [String: Any]? = nil, completion: @escaping CompletionCallback<T>) {
        
        guard let url = URL(string: "\(self.baseUrl)\(endpoint.url)") else {
            completion(.failure(.malformedURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
        if endpoint.httpMethod == HttpMethods.post.rawValue {
            guard let params = params else {
                completion(.failure(.postBodyNotInformed))
                return
            }
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpBody = params.percentEscaped().data(using: .utf8)
        }
        
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodedObject = try RequestMaker.decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        dataTask.resume()
    }
}
