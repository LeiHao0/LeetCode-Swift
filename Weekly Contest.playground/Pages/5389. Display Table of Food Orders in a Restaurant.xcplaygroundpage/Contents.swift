//: [Previous](@previous)

class Solution {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        var dict = [Int: [String: Int]]()
        var set = Set<String>()

        orders.forEach { arr in
            let table = Int(arr[1])!, foodItem = arr[2]
            set.insert(foodItem)
            if dict[table] != nil {
                if dict[table]![foodItem] != nil {
                    dict[table]![foodItem] = dict[table]![foodItem]! + 1
                } else {
                    dict[table]![foodItem] = 1
                }
            } else {
                dict[table] = [foodItem: 1]
            }
        }
        let foods = set.sorted()

        var v = [[String]]()
        v.append(["Table"] + foods)

        let keys = dict.keys.sorted()
        for k in keys {
            let d = dict[k]!
            var s = [String(k)]
            for f in foods {
                s.append(String(d[f] ?? 0))
            }
            v.append(s)
        }

//        print(v)

        return v
    }
}

let s = Solution()
s.displayTable([["David", "3", "Ceviche"], ["Corina", "10", "Beef Burrito"], ["David", "3", "Fried Chicken"], ["Carla", "5", "Water"], ["Carla", "5", "Ceviche"], ["Rous", "3", "Ceviche"]])
// [["Table","Beef Burrito","Ceviche","Fried Chicken","Water"],
//  ["3","0","2","1","0"],
//  ["5","0","1","0","1"],
//  ["10","1","0","0","0"]]

s.displayTable([["James", "12", "Fried Chicken"], ["Ratesh", "12", "Fried Chicken"], ["Amadeus", "12", "Fried Chicken"], ["Adam", "1", "Canadian Waffles"], ["Brianna", "1", "Canadian Waffles"]])

s.displayTable([["Laura", "2", "Bean Burrito"], ["Jhon", "2", "Beef Burrito"], ["Melissa", "2", "Soda"]])

//: [Next](@next)
