//
//  HttpClient.swift
//  MVVM
//
//  Created by Merouane Bellaha on 26/01/2022.
//

import Foundation

struct HttpClient {
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("url error")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data error")
                return
            }

            do {
                let userModels = try JSONDecoder().decode([User].self, from: data)
                completion(.success(userModels))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
