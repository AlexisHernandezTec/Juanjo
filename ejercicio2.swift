func menorDeTres(_ n1: Int, _ n2: Int, _ n3: Int) -> Int {
    return n1 <= n2 && n1 <= n3 ? n1 : n2 <= n1 && n2 <= n3 ? n2 : n3
}
let resultado = menorDeTres(1, 1, 1)
print("El menor de los tres números es: \(resultado)")