enum Palo: String {
    case corazones = "Corazones"
    case diamantes = "Diamantes"
    case treboles = "Treboles"
    case espadas = "Espadas"
}

enum Valor: Int {
    case AS = 1
    case dos = 2
    case tres = 3
    case cuatro = 4
    case cinco = 5
    case seis = 6
    case siete = 7
    case ocho = 8
    case nueve = 9
    case diez = 10
    case J = 11
    case Q = 12
    case K = 13
}

struct Carta {
    let palo: Palo
    let valor: Valor
}

func obtenerCartaAleatoria() -> Carta {
    let palos = [Palo.corazones, .diamantes, .treboles, .espadas]
    let valores = [Valor.AS, .dos, .tres, .cuatro, .cinco, .seis, .siete, .ocho, .nueve, .diez, .J, .Q, .K]
    let paloAleatorio = palos.randomElement()!
    let valorAleatorio = valores.randomElement()!
    return Carta(palo: paloAleatorio, valor: valorAleatorio)
}

func calcularValorMano(_ cartas: [Carta]) -> Int {
    var valorTotal = 0
    var cantidadAs = 0
    for carta in cartas {
        switch carta.valor {
        case .AS:
            cantidadAs += 1
            valorTotal += 11
        default:
            valorTotal += carta.valor.rawValue
        }
    }
    // Ajustar el valor de los AS si se pasa de 21
    while valorTotal > 21 && cantidadAs > 0 {
        valorTotal -= 10
        cantidadAs -= 1
    }
    return valorTotal
}

func jugar() {
    var cartasMano = [Carta]()
    while true {
        print("Tu mano actual: \(cartasMano.map { "\($0.valor.rawValue) de \($0.palo.rawValue)" }.joined(separator: ", "))")
        print("Valor actual: \(calcularValorMano(cartasMano))")
        if calcularValorMano(cartasMano) > 21 {
            print("Has perdido! Tu valor es mayor que 21.")
            break
        } else if calcularValorMano(cartasMano) == 21 {
            print("Has ganado! Tu valor es exactamente 21.")
            break
        }
        print("¿Quieres pedir otra carta? (s/n)")
        let respuesta = readLine()!
        if respuesta.lowercased() == "s" {
            cartasMano.append(obtenerCartaAleatoria())
        } else {
            break
        }
    }
}

jugar()