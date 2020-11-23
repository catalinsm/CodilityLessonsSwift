//
//  Lesson4 - MissingInteger.swift
//  CodilityLessonsSwift
//
//  Created by Cătălin Sminticiuc on 23/11/2020.
//

import Foundation

//This is a demo task.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
//
//For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
//
//Given A = [1, 2, 3], the function should return 4.
//
//Given A = [−1, −3], the function should return 1.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//each element of array A is an integer within the range [−1,000,000..1,000,000].

func solutionLesson4MissingInteger(_ A : inout [Int]) -> Int {

    guard A.count > 0 else {
        return 1
    }

    A.sort()

    if A[A.count - 1] <= 0 {
        return 1
    }

    if A[0] > 1 {
        return 1
    }

    for i in 0 ..< A.count - 1 {
        if A[i] <= 0 {
            if A[i+1] > 1 {
                return 1
            }
            continue
        }
        if A[i+1] - A[i] > 1 {
            return A[i] + 1
        }
    }

    return A[A.count - 1] + 1
}
