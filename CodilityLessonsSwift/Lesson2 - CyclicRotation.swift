//
//  Lesson2 - CyclicRotation.swift
//  CodilityLessonsSwift
//
//  Created by Cătălin Sminticiuc on 23/11/2020.
//

import Foundation

//An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
//
//The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
//
//Write a function:
//
//public func solution(_ A : inout [Int], _ K : Int) -> [Int]
//that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
//
//For example, given
//
//    A = [3, 8, 9, 7, 6]
//    K = 3
//the function should return [9, 7, 6, 3, 8]. Three rotations were made:
//
//    [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
//    [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
//    [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
//For another example, given
//
//    A = [0, 0, 0]
//    K = 1
//the function should return [0, 0, 0]
//
//Given
//
//    A = [1, 2, 3, 4]
//    K = 4
//the function should return [1, 2, 3, 4]
//
//Assume that:
//
//N and K are integers within the range [0..100];
//each element of array A is an integer within the range [−1,000..1,000].
//In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.

func solutionLesson2CyclicRotation(_ A : inout [Int], _ K : Int) -> Array<Int> {

    guard A.count >= 2 else {
        return A
    }

    var result = A

    for _ in 0 ..< K {
        result = rotateByOne(a: result, direction: .right)
    }

    return result
}

fileprivate enum RotarionDirection {
    case left
    case right
}

fileprivate func rotateByOne(a: Array<Int>, direction: RotarionDirection) -> Array<Int> {

    var aMutable = a

    switch direction {
    case .left:
        let elementToMove = aMutable.removeFirst()
        aMutable.append(elementToMove)
    case .right:
        let elementToMove = aMutable.removeLast()
        aMutable.insert(elementToMove, at: aMutable.startIndex)
    }

    return aMutable
}
