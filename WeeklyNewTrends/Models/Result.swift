//
//  Result.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 11/12/20.
//

import Foundation

enum Result<T, E: Error> {
	case success(T)
	case failure(E)
}
