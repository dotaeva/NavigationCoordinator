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
typealias AppCoordinator = NavigationCoordinator<Destination>
```

## Použití pro zobrazení

Reprezentace koordinátoru zobrazuje `View` definici `Routable` uvnitř `NavigationStack`. Je-li `root` koordinátoru prázdný, zobrazí `EmptyView()`.

**view(root: Routable)**
- Nastaví hodnotu `root` a navrátí `View` reprezentaci koordinátoru.

**Použití:**
```swift
var body: some Scene {
    WindowGroup {
        AppCoordinator.view(root: .home)
    }
}
```

**view()**
- Navrátí `View` reprezentaci koordinátoru.

**Použití:**
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
- Po zavolání vymaže `Routable` nacházející se na vrcholu `path`.

**Použití:**
```swift
AppCoordinator.dismiss()
```

**pop()**
- Po zavolání vymaže a navrací `Routable` nacházející se na vrcholu `path`.

**Použití:**
```swift
AppCoordinator.pop()
```

**popToRoot()**
- Po zavolání vymaže všechny `Routable` z `path`.

**Použití:**
```swift
AppCoordinator.popToRoot()
```

**popToLast(route: Routable)**
- Po zavolání vymaže všechny `Routable`, dokud nenarazí na hledaný `route`. Pokud se hledaný `route` nenachází v `path`, vyhodí chybu a nepokračuje.

**Použití:**
```swift
AppCoordinator.popToLast(.home)
```

**peek()**
- Po zavolání navrací `Routable` nacházející se na vrcholu `path`.

**Použití:**
```swift
if let topRoute = AppCoordinator.peek() {
    print("Top route is: \(topRoute)")
}
```

### Proměnné

**root**
- Proměnná navracející či nastavující `root` koordinátoru typu `<T>`.

**Použití:**
```swift
print(AppCoordinator.root)
AppCoordinator.root = .home
```

**path**
- Proměnná navracející `path` koordinátoru typu `<T>`.

**Použití:**
```swift
print(AppCoordinator.path)
AppCoordinator.root = .home
```
