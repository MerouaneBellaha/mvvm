//
//  UserListViewModel.swift
//  MVVM
//
//  Created by Merouane Bellaha on 26/01/2022.
//

import Foundation

struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])

    var httpClient = HttpClient()

    func fetchUsers() {
        httpClient.fetchUsers { result in
            switch result {
            case .failure: print("error")
            case .success(let users): self.users.value = users.compactMap { UserTableViewCellViewModel(name: $0.name) }
            }
        }
    }
}
