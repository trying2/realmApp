//
//  MovieViewModel.swift
//  MovieViewModel
//
//  Created by Александр Вяткин on 18.09.2021.
//

import Foundation
import Networking
import RealmSwift
import Realm

final class MovieViewModel: ObservableObject {
    @Published var movieList: [Movie] = .init()
    
    @Published var isPageLoading: Bool = false
    
    @Published var page: Int = 0
    @Published var totalResults: Int = 999
    @Published var pageLoadCount: Int = 0
    
    private let storageService: StorageService = .init()
    
    let apiKey = "0dc34a2f3a360bd0e26e68231be276ef"
    
    init() {
        storageService.clearMovies()
        movieList = storageService.getMovies()
        fetchTrendingMoviesPage()
    }
    
    func fetchTrendingMoviesPage() {
        guard isPageLoading == false, movieList.count < totalResults else {
            return
        }
        isPageLoading = true
        page += 1
        
        MoviesAPI.getTrendingMovie(apiKey: apiKey, page: page) { data, error in
            self.isPageLoading = false
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            guard let movieData = data else {
                return
            }
            self.pageLoadCount += 1
            
            self.totalResults = movieData.totalResults
            
            movieData.results.forEach { movie in
                self.storageService.addMovie(movie)
            }
            
            self.movieList.append(contentsOf: movieData.results)
        }
    }
}
