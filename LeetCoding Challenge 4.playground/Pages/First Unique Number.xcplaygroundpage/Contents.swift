//: [Previous](@previous)

/**
 # First Unique Number

 You have a queue of integers, you need to retrieve the first unique integer in the queue.

 Implement the `FirstUnique` class:

 - `FirstUnique(int[] nums)` Initializes the object with the numbers in the queue.
 - `int showFirstUnique()` returns the value of **the first unique** integer of the queue, and returns **-1** if there is no such integer.
 - `void add(int value)` insert value to the queue.

 **Example 1:**

 ```
 Input:
 ["FirstUnique","showFirstUnique","add","showFirstUnique","add","showFirstUnique","add","showFirstUnique"]
 [[[2,3,5]],[],[5],[],[2],[],[3],[]]
 Output:
 [null,2,null,2,null,3,null,-1]

 Explanation:
 FirstUnique firstUnique = new FirstUnique([2,3,5]);
 firstUnique.showFirstUnique(); // return 2
 firstUnique.add(5);            // the queue is now [2,3,5,5]
 firstUnique.showFirstUnique(); // return 2
 firstUnique.add(2);            // the queue is now [2,3,5,5,2]
 firstUnique.showFirstUnique(); // return 3
 firstUnique.add(3);            // the queue is now [2,3,5,5,2,3]
 firstUnique.showFirstUnique(); // return -1
 ```

 **Example 2:**

 ```
 Input:
 ["FirstUnique","showFirstUnique","add","add","add","add","add","showFirstUnique"]
 [[[7,7,7,7,7,7]],[],[7],[3],[3],[7],[17],[]]
 Output:
 [null,-1,null,null,null,null,null,17]

 Explanation:
 FirstUnique firstUnique = new FirstUnique([7,7,7,7,7,7]);
 firstUnique.showFirstUnique(); // return -1
 firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7]
 firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3]
 firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3,3]
 firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7,3,3,7]
 firstUnique.add(17);           // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
 firstUnique.showFirstUnique(); // return 17
 ```

 **Example 3:**

 ```
 Input:
 ["FirstUnique","showFirstUnique","add","showFirstUnique"]
 [[[809]],[],[809],[]]
 Output:
 [null,809,null,-1]

 Explanation:
 FirstUnique firstUnique = new FirstUnique([809]);
 firstUnique.showFirstUnique(); // return 809
 firstUnique.add(809);          // the queue is now [809,809]
 firstUnique.showFirstUnique(); // return -1
 ```

 **Constraints:**

 - `1 <= nums.length <= 10^5`
 - `1 <= nums[i] <= 10^8`
 - `1 <= value <= 10^8`
 - At most `50000` calls will be made to `showFirstUnique` and `add`.

   Hide Hint #1

 Use doubly Linked list with hashmap of pointers to linked list nodes. add unique number to the linked list. When add is called check if the added number is unique then it have to be added to the linked list and if it is repeated remove it from the linked list if exists. When showFirstUnique is called retrieve the head of the linked list.

   Hide Hint #2

 Use queue and check that first element of the queue is always unique.

   Hide Hint #3

 Use set or heap to make running time of each function O(logn).
 */

class FirstUnique {
    init(_ nums: [Int]) {
        head.next = tail
        tail.prev = head
        for n in nums { add(n) }
    }

    func showFirstUnique() -> Int {
        return head.next?.value ?? -1
    }

    func add(_ value: Int) {
        if sets.contains(value) { // dict.keys.contains(value) wrong answer
            rmNode(dict[value] ?? nil)
            dict[value] = nil
        } else {
            let node = DLNode(value)
            addNode(node)
            dict[value] = node
            sets.insert(value)
        }
    }

    private func po(_ h: DLNode) {
        var p: DLNode? = h
        while let q = p?.next {
            print(q.value, terminator: ", ")
            p = q.next
        }
        print("\n")
    }

    private class DLNode {
        var value: Int, prev: DLNode?, next: DLNode?
        init(_ v: Int = -1) { value = v }
    }

    private var dict = [Int: DLNode?](), head = DLNode(), tail = DLNode(), sets = Set<Int>()
    private func addNode(_ node: DLNode) {
        node.next = tail
        node.prev = tail.prev
        tail.prev = node
        node.prev?.next = node
    }

    private func rmNode(_ node: DLNode?) {
        guard let node = node else { return }
        let prev = node.prev, next = node.next
        prev?.next = next
        next?.prev = prev
    }
}

var s = FirstUnique([2, 3, 5])
s.showFirstUnique() // 2
s.add(5)
s.showFirstUnique() // 2
s.add(2)
s.showFirstUnique() // 3
s.add(3)
s.showFirstUnique() // -1

s = FirstUnique([7, 7, 7, 7, 7, 7])
s.showFirstUnique() // return -1
s.add(7) // the queue is now [7,7,7,7,7,7,7]
s.add(3) // the queue is now [7,7,7,7,7,7,7,3]
s.add(3) // the queue is now [7,7,7,7,7,7,7,3,3]
s.add(7) // the queue is now [7,7,7,7,7,7,7,3,3,7]
s.add(17) // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
s.showFirstUnique() // return 17

s = FirstUnique([809])
s.showFirstUnique() // return 809
s.add(809) // the queue is now [809,809]
s.showFirstUnique() // return -1

s = FirstUnique([])
s.showFirstUnique() // return -1
s.add(809) // the queue is now [809]
s.showFirstUnique() // return 809

s = FirstUnique([412, 655, 699, 414, 425, 156, 61, 407, 376, 185, 400, 66, 851, 739, 981, 916, 628, 707, 739, 820, 176, 358, 174, 24, 253, 553, 693, 330, 529, 679, 669, 598, 908, 525, 251, 490, 402, 726, 760, 471, 483, 396, 610, 217, 539, 541, 11, 908, 8, 939, 457, 656, 958, 766, 857, 552, 547, 425, 524, 831, 140, 125, 929, 412, 865, 251, 471, 911, 957, 875, 297, 276, 553, 708, 595, 207, 352, 564, 163, 74, 891, 100, 991, 107, 639, 625, 408, 4, 847, 769, 4, 23, 600, 723, 11, 763, 66, 101, 462, 297, 755, 303, 890, 949, 701, 829, 454, 972, 368, 865, 864, 459, 635, 661, 24, 392, 979, 907, 799, 296, 207, 837, 539, 131, 656, 559, 677, 429, 593, 315, 25, 785, 658, 351, 831, 98, 563, 948, 732, 102, 498, 805, 104, 502, 669, 757, 450, 562, 574, 186, 745, 34, 546, 546, 773, 908, 14, 673, 547, 651, 856, 391, 529, 579, 809, 8, 939, 191, 705, 983, 593, 622, 57, 366, 69, 871, 266, 784, 803, 694, 87, 84, 6, 440, 923, 853, 992, 988, 497, 162, 136, 943, 493, 533, 664, 462, 80, 25, 600, 225, 542, 766, 850, 648, 929, 862, 564, 375, 935, 241, 384, 793, 491, 250, 1, 172, 270, 517, 516, 890, 550, 787, 209, 458, 897, 194, 430, 756, 517, 418, 270, 127, 668, 949, 293, 621, 984, 504, 970, 23, 279, 903, 755, 294, 863, 591, 514, 6, 678, 857, 629, 368, 967, 975, 953, 767, 393, 531, 476, 744, 278, 262, 603, 778, 688, 448, 987, 115, 222, 385, 437, 394, 898, 579, 137, 712, 963, 788, 584, 796, 838, 770, 91, 181, 368, 757, 551, 542, 941, 777, 248, 561, 406, 257, 589, 820, 499, 79, 385, 932, 204, 615, 768, 493, 930, 870, 958, 650, 601, 281, 197, 698, 237, 988, 557, 800, 999, 882, 475, 982, 92, 446, 870, 904, 949, 397, 804, 866, 379, 303, 875, 992, 827, 262, 628, 622, 620, 190, 630, 909, 686, 434, 92, 63, 916, 35, 358, 596, 360, 322, 647, 530, 200, 85, 245, 129, 400, 174, 954, 390, 898, 298, 447, 732, 706, 206, 831, 641, 469, 762, 489, 412, 197, 294, 188, 974, 354, 958, 164, 530, 605, 324, 1000, 760, 947, 54, 100, 701, 639, 399, 340, 523, 628, 65, 635, 832, 695, 469, 200, 319, 724, 538, 373, 574, 117, 351, 895, 44, 113, 88, 585, 637, 450, 901, 219, 560, 169, 44, 956, 68, 340, 580, 614, 801, 80, 187, 102, 469, 324, 737, 214, 716, 132, 86, 293, 261, 921, 440, 141, 307, 67, 455, 430, 653, 896, 974, 765, 75, 638, 261, 967, 415, 483, 695, 597, 810, 165, 977, 507, 7, 314, 67, 669, 23, 983, 445, 577, 448, 378, 123, 322, 686, 529, 781, 811, 319, 42, 857, 782, 918, 840, 787, 298, 377, 603, 95, 508, 580, 138, 162, 14, 884, 210, 386, 1, 615, 464, 466, 858, 991, 110, 989, 495, 129, 615, 140, 771, 226, 306, 60, 832, 225, 620, 260, 478, 425, 267, 725, 127, 362, 470, 521, 763, 459, 292, 269, 443, 845, 697, 151, 426, 601, 882, 288, 285, 789, 461, 252, 325, 173, 130, 512, 403, 646, 806, 55, 722, 853, 366, 343, 157, 687, 426, 586, 516, 239, 211, 150, 72, 340, 350, 390, 736, 181, 351, 554, 914, 645, 518, 487, 245, 179, 339, 668, 753, 204, 772, 474, 602, 127, 45, 340, 491, 43, 613, 681, 449, 831, 714, 467, 81, 291, 893, 12, 423, 7, 565, 964, 217, 402, 650, 268, 750, 207, 834, 118, 224, 899, 304, 445, 400, 439, 632, 582, 460, 905, 655, 976, 322, 947, 17, 490, 765, 92, 787, 332, 319, 317, 347, 902, 301, 102, 740, 133, 365, 389, 727, 757, 159, 187, 93, 925, 379, 769, 151, 657, 155, 172, 769, 421, 748, 315, 714, 23, 481, 973, 777, 356, 299, 474, 710, 219, 163, 577, 109, 753, 369, 108, 323, 523, 313, 661, 277, 621, 699, 697, 901, 131, 358, 973, 371, 215, 330, 555, 918, 828, 65, 463, 880, 551, 983, 234, 28, 247, 676, 166, 197, 129, 783, 475, 880, 418, 383, 102, 804, 152, 732, 452, 718, 716, 630, 312, 508, 358, 72, 371, 16, 870, 615, 836, 640, 520, 289, 553, 155, 881, 503, 603, 684, 767, 133, 349, 869, 871, 610, 237, 950, 378, 432, 589, 912, 73, 531, 194, 806, 227, 452, 759, 972, 56, 531, 759, 62, 998, 310, 712, 955, 537, 291, 708, 603, 60, 900, 590, 485, 946, 443, 342, 873, 871, 753, 472, 352, 974, 317, 212, 516, 371, 326, 694, 200, 671, 411, 349, 891, 507, 81, 815, 723, 133, 965, 151, 202, 342, 336, 245, 257, 215, 167, 254, 932, 976, 571, 668, 24, 224, 977, 907, 768, 767, 649, 255, 182, 91, 998, 934, 153, 599, 596, 82, 660, 26, 761, 164, 433, 655, 602, 319, 587, 942, 124, 97, 561, 97, 504, 340, 514, 29, 843, 386, 756, 128, 911, 296, 952, 933, 243, 12, 455, 415, 636, 107, 255, 811, 94, 849, 474, 728, 886, 334, 533, 649, 296, 581, 900, 470, 818, 469, 996, 943, 288, 69, 246, 972, 993, 996, 437, 422, 903, 740, 96, 367, 558, 918, 615, 802, 410, 298, 52, 55, 902, 583, 595, 919, 658, 737, 524, 624, 786, 323, 119, 791, 873, 422, 528, 25, 712, 79, 440, 546, 336, 260, 298, 667, 571, 453, 242, 281, 119, 763, 787, 530, 156, 922, 672, 518, 781, 754, 590, 677, 375, 303, 323, 908, 403, 107, 596, 390, 601, 338, 332, 146, 796, 503, 863, 775, 649, 483, 249, 556, 620, 73, 751, 786, 353, 898, 622, 110, 297, 387, 76, 51, 348, 583, 584, 687, 826, 646, 253, 340, 647, 212, 547, 850, 880, 326, 328, 184, 510, 857, 630, 556, 350, 500, 103, 16, 784, 890, 12, 286, 87, 851, 962, 54, 335, 997, 88, 364, 772, 643, 728, 337, 149, 52, 519, 548, 127, 562, 150, 758, 185, 444, 598, 848, 162, 213, 864, 748, 643, 892, 518, 536, 315, 983, 15, 999, 656, 673, 192, 578, 785, 726, 952, 920, 160, 17, 212, 549, 93, 469, 589, 810, 18, 134, 795, 281, 182, 852, 841, 519, 746, 68, 594, 892, 278, 497, 642, 688, 6, 312, 654, 124, 391, 497, 565, 716, 460, 18, 115, 125, 357, 568, 260, 91, 203, 636, 970, 47, 861, 8, 202, 278, 684, 808, 707, 798, 704, 219, 838, 746, 547, 498, 388, 922, 16, 336, 458, 608, 437, 275, 530, 477, 706, 925, 662, 42, 728, 691, 541, 808, 585, 549, 975, 872, 778, 851, 452, 926, 974, 355, 955, 215, 637, 752, 359, 108, 428, 395, 288, 468, 389, 178, 161, 216, 713, 284, 425, 617, 186, 184, 606, 674, 878, 169, 442, 499, 625, 718, 830, 685, 900, 497, 272, 743, 93, 106, 1000, 453, 651, 869, 367, 68, 294, 34, 683, 886, 464, 192, 442, 138, 326, 330, 574, 355, 148, 465, 541, 180, 867, 431, 681, 164, 519, 204, 886, 270, 62, 187, 840, 207, 814, 375, 942, 70, 54, 792, 791, 701, 115, 232, 489, 344, 32, 258, 134, 108, 618, 76, 822, 474, 293, 525, 667, 536, 97, 278, 266, 81, 936, 27, 822, 365, 569, 671, 282, 53, 784, 204, 612, 162, 79, 295, 582, 354, 331, 626, 554, 722, 374, 464, 967, 189, 605, 299, 433, 983, 911, 692, 70, 819, 562, 17, 996, 827, 995, 652, 327, 561, 306, 548, 661, 432, 725, 110, 347, 270, 33, 79, 218, 794, 309, 264, 341, 652, 960, 380, 440, 400, 241, 754, 736, 231, 355, 159, 281, 244, 918, 979, 420, 632, 120, 954, 886, 819, 378, 193, 998, 339, 275, 698, 106, 827, 802, 79, 680, 394, 831, 476, 103, 193, 792, 640, 441, 501, 350, 801, 658, 284, 49, 892, 291, 850, 607, 451, 704, 761, 397, 798, 740, 611, 226, 934, 518, 418, 996, 307, 918, 466, 858, 912, 915, 432, 62, 131, 176, 325, 414, 384, 701, 267, 228, 92, 284, 343, 466, 924, 675, 968, 907, 232, 289, 237, 822, 104, 634, 449, 415, 511, 756, 438, 115, 665, 722, 205, 136, 162, 887, 76, 382, 240, 56, 593, 517, 371, 25, 116, 792, 618, 120, 304, 201, 974, 160, 911, 453, 308, 419, 614, 823, 506, 533, 797, 848, 131, 972, 606, 668, 445, 462, 797, 407, 106, 783, 555, 681, 715, 159, 617, 366, 239, 309, 856, 505, 327, 696, 104, 614, 479, 806, 977, 882, 108, 977, 799, 758, 170, 320, 361, 809, 707, 731, 662, 979, 701, 876, 804, 565, 884, 395, 341, 279, 505, 309, 151, 642, 324, 257, 71, 406, 614, 263, 128, 296, 524, 301, 627, 581, 41, 9, 6, 37, 219, 464, 514, 840, 159, 257, 191, 988, 531, 477, 671, 707, 686, 859, 17, 462, 356, 81, 672, 704, 195, 839, 408, 410, 630, 532, 418, 127, 249, 371, 326, 90, 805, 153, 554, 484, 86, 985, 674, 127, 59, 307, 621, 750, 639, 413, 158, 109, 152, 545, 361, 865, 888, 29, 468, 636, 50, 296, 218, 205, 752, 766, 239, 694, 220, 617, 724, 886, 237, 339, 907, 922, 641, 861, 390, 957, 297, 318, 247, 683, 166, 669, 891, 648, 963, 500, 162, 362, 794, 202, 1, 368, 96, 517, 692, 722, 22, 584, 940, 308, 149, 516, 717, 115, 32, 142, 173, 316, 985, 988, 599, 715, 771, 744, 390, 788, 511, 99, 950, 787, 566, 350, 813, 708, 565, 41, 225, 259, 783, 12, 397, 529, 146, 455, 575, 320, 623, 230, 83, 997, 101, 643, 296, 656, 529, 619, 399, 925, 307, 606, 251, 166, 806, 2, 14, 200, 819, 324, 824, 801, 468, 227, 12, 297, 106, 399, 594, 910, 585, 256, 529, 863, 512, 840, 749, 982, 149, 759, 935, 87, 314, 953, 377, 966, 746, 503, 474, 419, 967, 50, 837, 507, 453, 220, 257, 914, 591, 74, 544, 307, 955, 30, 157, 321, 933, 378, 159, 137, 805, 385, 378, 806, 589, 501, 619, 234, 926, 326, 201, 528, 157, 408, 382, 946, 22, 838, 841, 100, 135, 883, 104, 82, 614, 941, 60, 79, 37, 697, 748, 940, 285, 26, 409, 690, 190, 803, 256, 320, 324, 8, 801, 501, 333, 82, 235, 724, 309, 987, 687, 453, 279, 511, 738, 152, 858, 289, 724, 577, 722, 99, 978, 654, 643, 928, 853, 959, 724, 297, 208, 411, 692, 729, 780, 876, 838, 764, 379, 938, 214, 341, 998, 703, 945, 141, 351, 950, 417, 353, 831, 135, 891, 409, 686, 585, 96, 859, 459, 751, 906, 794, 764, 349, 796, 740, 121, 920, 629, 449, 159, 509, 228, 921, 308, 38, 200, 491, 172, 483, 87, 753, 601, 704, 182, 559, 983, 714, 270, 594, 734, 214, 816, 542, 193, 72, 573, 457, 3, 144, 603, 35, 745, 824, 539, 903, 223, 978, 630, 468, 830, 988, 485, 603, 219, 726, 126, 324, 167, 603, 310, 5, 435, 284, 745, 151, 644, 823, 446, 695, 765, 796, 274, 703, 874, 145, 637, 977, 578, 58, 800, 469, 474, 509, 871, 388, 678, 375, 322, 587, 467, 829, 364, 275, 40, 314, 49, 779, 497, 719, 332, 299, 387, 64, 647, 149, 133, 151, 879, 14, 568, 623, 443, 184, 617, 614, 892, 63, 460, 115, 893, 428, 201, 844, 971, 847, 37, 289, 813, 295, 503, 231, 193, 685, 618, 254, 631, 787, 398, 422, 663, 732, 323, 359, 375, 270, 967, 152, 214, 439, 680, 744, 555, 264, 577, 978, 422, 819, 69, 186, 49, 987, 298, 173, 517, 358, 714, 223, 481, 823, 857, 309, 672, 116, 155, 980, 907, 300, 682, 432, 284, 693, 427, 323, 278, 298, 541, 969, 685, 431, 272, 162, 910, 94, 155, 161, 161, 65, 670, 398, 100, 216, 205, 686, 988, 607, 236, 867, 840, 994, 461, 626, 458, 992, 949, 153, 350, 807, 996, 108, 904, 496, 280, 276, 323, 147, 131, 716, 813, 632, 669, 270, 846, 159, 978, 736, 439, 887, 527, 308, 435, 912, 731, 658, 551, 315, 375, 572, 350, 92, 309, 78, 919, 10, 35, 557, 146, 607, 825, 694, 347, 680, 953, 237, 842, 873, 638, 386, 138, 575, 562, 476, 799, 462, 665, 580, 509, 855, 738, 286, 945, 122, 916, 144, 95, 918, 431, 355, 323, 111, 519, 838, 749, 177, 635, 802, 107, 506, 132, 926, 236, 280, 290, 439, 117, 496, 174, 164, 218, 481, 598, 736, 559, 218, 987, 718, 202, 242, 15, 825, 195, 761, 118, 687, 366, 242, 359, 296, 240, 454, 162, 639, 116, 804, 404, 167, 959, 447, 489, 507, 451, 316, 404, 344, 687, 855, 550, 605, 633, 87, 383, 551, 519, 670, 95, 857, 662, 701, 581, 598, 684, 925, 171, 160, 226, 916, 256, 474, 147, 695, 885, 961, 786, 928, 235, 289, 300, 718, 96, 825, 886, 831, 254, 134, 849, 800, 194, 593, 747, 422, 3, 747, 648, 277, 285, 545, 616, 139, 223, 356, 807, 305, 338, 899, 591, 632, 148, 238, 496, 252, 757, 101, 910, 929, 409, 977, 7, 636, 768, 319, 486, 261, 471, 849, 144, 574, 450, 370, 719, 408, 450, 202, 434, 50, 915, 600, 208, 128, 970, 398, 947, 110, 418, 997, 182, 558, 950, 389, 86, 938, 601, 407, 844, 707, 150, 96, 566, 216, 6, 379, 720, 858, 461, 169, 676, 534, 803, 30, 361, 883, 885, 243, 847, 649, 514, 381, 470, 114, 336, 911, 318, 504, 555, 392, 863, 239, 959, 256, 595, 353, 440, 397, 757, 367, 407, 191, 802, 486, 734, 556, 381, 419, 423, 589, 814, 697, 834, 650, 964, 798, 906, 297, 373, 867, 941, 810, 867, 187, 729, 663, 61, 33, 133, 616, 246, 526, 356, 430, 286, 124, 268, 579, 884, 173, 497, 889, 36, 910, 647, 953, 15, 611, 101, 965, 428, 933, 156])
s.showFirstUnique()
//: [Next](@next)
