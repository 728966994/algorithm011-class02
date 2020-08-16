import UIKit

// 231. 2的幂

func isPowerOfTwo(_ n: Int) -> Bool {
    return (n > 0 ) && ((n & ( -n )) == n);
}

