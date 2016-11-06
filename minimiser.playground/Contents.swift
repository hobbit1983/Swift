//: Playground - noun: a place where people can play

import Cocoa

/*
 Returns a string with two '+' symbols 
 inserted to give the smallest possible sum
 */
func minimiser(inputstr: String) ->String{
    print("Resolving for String: " + inputstr)
    let characters = Array(inputstr.characters)
    var currentMinimum = Int.max
    var bestPosA = 0;
    var bestPosB = 0;
    
    for index1 in 1...characters.count-1{
        for index2 in index1...characters.count-1{
            if index1 == index2{
                continue
            }
            let currentAttempt = calculate(numbers: characters, posA: index1, posB: index2)
            if currentAttempt < currentMinimum{
                currentMinimum = currentAttempt
                bestPosA = index1
                bestPosB = index2
            }
        }
    }

    return "Min " + createNewString(numbers: characters, posA: bestPosA, posB: bestPosB)
}

func maximiser(inputstr: String) ->String{
    print("Resolving for String: " + inputstr)
    let characters = Array(inputstr.characters)
    var currentMinimum = Int.min
    var bestPosA = 0;
    var bestPosB = 0;
    
    for index1 in 1...characters.count-1{
        for index2 in index1...characters.count-1{
            if index1 == index2{
                continue
            }
            let currentAttempt = calculate(numbers: characters, posA: index1, posB: index2)
            if currentAttempt > currentMinimum{
                currentMinimum = currentAttempt
                bestPosA = index1
                bestPosB = index2
            }
        }
    }
    
    return "Max: " + createNewString(numbers: characters, posA: bestPosA, posB: bestPosB)
}


func calculate(numbers: Array<Character>, posA: Int, posB: Int) ->Int {
    //carve the string into 3 numbers at point A and point B
    let number1 = Int(String(numbers[0...posA-1]))
    let number2 = Int(String(numbers[posA...posB-1]))
    let number3 = Int(String(numbers[posB...numbers.endIndex-1]))
    
    var answer = 0
    answer = number1!
    answer += number2!
    answer += number3!
  
    return answer
}

func createNewString(numbers: Array<Character>,posA: Int, posB: Int) -> String{
    var response = String(numbers[0...posA-1]) + "+" + String(numbers[posA...posB-1]) + "+" + String(numbers[posB...numbers.endIndex-1])
    response += "= " + String(calculate(numbers: numbers, posA: posA, posB: posB))
    return response
}

print(minimiser(inputstr: "123456789"))
print(maximiser(inputstr: "123456789"))
print(minimiser(inputstr: "8924658371"))
print(maximiser(inputstr: "8924658371"))

