func binarioADecimal(_ b3: Int, _ b2: Int, _ b1: Int, _ b0: Int) -> Int {
    return (b3 * 8) + (b2 * 4) + (b1 * 2) + b0
}
print(binarioADecimal(1, 1, 1, 1))
print(binarioADecimal(0, 1, 1, 0))
print(binarioADecimal(0, 0, 1, 0))