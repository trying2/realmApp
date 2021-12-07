//
//  RealmMovie.swift
//  SuiApp2
//
//  Created by Александр Вяткин on 07.12.2021.
//

import Foundation
import RealmSwift
import Realm

class RealmMovie: RealmSwiftObject {
    @Persisted var originalLanguage: String = ""
    @Persisted var originalTitle: String = ""
    @Persisted var posterPath: String = ""
    @Persisted var id: Int = 0
    @Persisted var voteCount: Double = 0.0
    @Persisted var overview: String = ""
    @Persisted var releaseDate: String = ""
    @Persisted var voteAverage: Double = 0.0
    @Persisted var title: String = ""
    @Persisted var backdropPath: String = ""
    @Persisted var popularity: Double = 0.0
    @Persisted var mediaType: String = ""
}
