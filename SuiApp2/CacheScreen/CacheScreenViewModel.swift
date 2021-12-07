//
//  CacheScreenViewModel.swift
//  SuiApp2
//
//  Created by Александр Вяткин on 29.11.2021.
//

import Foundation
import RealmSwift
import Networking

final class CacheScreeViewModel: ObservableObject {
    @Published var movieList: [Movie] = []
    
    let storageService: StorageService
    
    init() {
        storageService = .init()
        fetchCachedMovies()
    }
    
    func fetchCachedMovies() {
        movieList = storageService.getMovies()
    }
    
}
