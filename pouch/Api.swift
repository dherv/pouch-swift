//
//  Api.swift
//  pouch
//
//  Created by Damien Hervieux on 2019/08/03.
//  Copyright © 2019 Damien Hervieux. All rights reserved.
//

import Foundation

class Api {
    static let shared = Api(baseUrl: URL(string:"http://localhost:8000/api/fixed/")!)
    
    let baseUrl: URL
    
    func get(completion: @escaping (Result<[Expense], Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: baseUrl) { data, response, error in
           
            if let error = error {
//                self.handleClientError(error)
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let expenses = try JSONDecoder().decode([Expense].self, from: data)
                completion(.success(expenses))
            } catch {
                completion(.failure(error))
            }
           
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
//                    self.handleServerError(response)
                    
                    return
            }
        }
        
        return task.resume()
    }
    
    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
}

