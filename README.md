# NavigationCoordinator

## Inicializace

### Definice `Routable`

```swift
import SwiftUI
import NavigationCoordinator

enum Destination: Routable {
    case home
    case count(Int)
}

extension Destination {
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            ContentView()
        case .count(let i):
            CountView(number: i)
        }
    }
}
```

### Nastavení aliasu pro snadnější použití

```swift
typealias AppCoordinator = Coordinator<Destination>
```

## Použití pro zobrazení

```swift
var body: some Scene {
    WindowGroup {
        AppCoordinator.view(root: .home)
    }
}
```

## Možnosti použití

### Navigace (.route)

**Route:**
```swift
AppCoordinator.route(to: .count(1))
```

### Prezentace (.present)

**Sheet:**
```swift
AppCoordinator.present(.count(1), as: .sheet)
```

**Fullscreen Cover:**
```swift
AppCoordinator.present(.count(1), as: .fullScreenCover)
```

### Pomocné funkce

**dismiss()**
- Po zavolání vymaže a navrací `Routable` nacházející se na vrcholu `path`.

**Usage:**
```swift
AppCoordinator.dismiss()
```

**popToRoot()**
- Po zavolání vymaže všechny `Routable` z `path`.

**Usage:**
```swift
AppCoordinator.popToRoot()
```

**popToLast(route: Routable)**
- Po zavolání vymaže všechny `Routable`, dokud nenarazí na hledaný `route`. Pokud se hledaný `route` nenachází v `path`, vyhodí chybu a nepokračuje.

**Usage:**
```swift
AppCoordinator.popToLast(.home)
```

**peek()**
- Po zavolání navrací `Routable` nacházející se na vrcholu `path`.

**Usage:**
```swift
if let topRoute = AppCoordinator.peek() {
    print("Top route is: \(topRoute)")
}
```