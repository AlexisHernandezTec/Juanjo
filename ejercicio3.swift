// Estructura para representar una carta
struct Carta {
    let rango: String
    let palo: String

    // Inicializador para crear una carta con un rango y un palo
    init(rango: String, palo: String) {
        self.rango = rango
        self.palo = palo
    }

    // Función para obtener una descripción de la carta
    func descripcion() -> String {
        return "\(rango) de \(palo)"
    }
}

// Estructura para representar una baraja de cartas
struct Baraja {
    var cartas: [Carta] = []

    // Inicializador para crear una baraja de cartas
    init() {
        let rangos = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let palos = ["Corazones", "Diamantes", "Treboles", "Espadas"]

        for palo in palos {
            for rango in rangos {
                cartas.append(Carta(rango: rango, palo: palo))
            }
        }
    }

    // Función para barajar la baraja
    mutating func barajar() {
        cartas.shuffle()
    }

    // Función para repartir una carta de la baraja
    mutating func repartirCarta() -> Carta? {
        if !cartas.isEmpty {
            return cartas.remove(at: 0)
        } else {
            return nil
        }
    }
}

// Estructura para representar un jugador
struct Jugador {
    var mano: [Carta] = []

    // Función para agregar una carta a la mano del jugador
    mutating func agregarCarta(_ carta: Carta) {
        mano.append(carta)
    }

    // Función para obtener una descripción de la mano del jugador
    func descripcionMano() -> String {
        var descripcion = ""
        for carta in mano {
            descripcion += "\(carta.descripcion())\n"
        }
        return descripcion
    }
}

// Crear una baraja de cartas y barajarla
var baraja = Baraja()
baraja.barajar()

// Crear tres jugadores
var jugador1 = Jugador()
var jugador2 = Jugador()
var jugador3 = Jugador()

// Repartir 5 cartas a cada jugador
for _ in 1...5 {
    if let carta = baraja.repartirCarta() {
        jugador1.agregarCarta(carta)
    }
    if let carta = baraja.repartirCarta() {
        jugador2.agregarCarta(carta)
    }
    if let carta = baraja.repartirCarta() {
        jugador3.agregarCarta(carta)
    }
}

// Imprimir la mano de cada jugador
print("Mano del jugador 1:")
print(jugador1.descripcionMano())
print("\nMano del jugador 2:")
print(jugador2.descripcionMano())
print("\nMano del jugador 3:")
print(jugador3.descripcionMano())