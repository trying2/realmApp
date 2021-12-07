//
//  StorageService.swift
//  SuiApp2
//
//  Created by Александр Вяткин on 07.12.2021.
//

import Foundation
import RealmSwift
import Networking

class StorageService {
    
    private var instance: Realm
    
    init() {
        let realmUrl = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("Movies.realm")
        var realmConfig = Realm.Configuration()
        realmConfig.fileURL = realmUrl
        instance = try! Realm.init(configuration: realmConfig, queue: DispatchQueue.main)
    }
    
    func getMovies() -> [Movie] {
        let results = self.instance.objects(RealmMovie.self)
        
        var movies: [Movie] = .init()
        
        movies = results.map( { Movie(originalLanguage: $0.originalLanguage, originalTitle: $0.originalTitle, posterPath: $0.posterPath, id: $0.id, voteCount: $0.voteCount, overview: $0.overview, releaseDate: $0.releaseDate, voteAverage: $0.voteAverage, title: $0.title, backdropPath: $0.backdropPath, popularity: $0.popularity, mediaType: $0.mediaType) })
        
        return movies
    }
    
    func clearMovies() {
        do {
            try self.instance.write({
                self.instance.deleteAll()
            })
        } catch {
            print("Error clearing realm")

        }
    }
    
    func addMovie(_ movie: Movie) {
            let realmMovie = RealmMovie()
        
            realmMovie.originalTitle = movie.originalTitle
            realmMovie.id = movie.id
        
            do {
                try self.instance.write({
                    self.instance.add(realmMovie)
                })
            } catch {
                print("Error adding realm")
            }
    }
}
