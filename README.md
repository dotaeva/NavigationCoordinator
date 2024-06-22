# NavigationCoordinator

## TypeAlias

```swift
typealias AppCoordinator = NavigationCoordinator<T>
```

## Variables

### `path`
Returns the current navigation path.

- **Returns:** An array representing the current path of type `[T]`.

#### Example Usage:
```swift
let currentPath = AppCoordinator.path
```

### `sheet`
Gets the current sheet.

- **Returns:** The current sheet of type `T`.

#### Example Usage:
```swift
if let currentSheet = AppCoordinator.sheet {
    print("Current sheet: \(currentSheet)")
}
```

### `fullScreenCover`
Gets the current full-screen cover.

- **Returns:** The current full-screen cover of type `T`.

#### Example Usage:
```swift
if let currentFullScreenCover = AppCoordinator.fullScreenCover {
    print("Current full-screen cover: \(currentFullScreenCover)")
}
```

### `root`
Gets or sets the root of the coordinator.

- **Returns:** The root of type `T`.

#### Example Usage:
```swift
if let rootView = AppCoordinator.root {
    print("Root view: \(rootView)")
}
AppCoordinator.root = .home
```

## Functions

### `route(to:)`
Routes to the specified destination.

- **Parameter:**
  - `destination: T` - The destination to route to.

#### Example Usage:
```swift
AppCoordinator.route(to: .detail)
```

### `present(_:as:onDismiss:)`
Presents the specified item as a sheet or full-screen cover.

- **Parameters:**
  - `item: T` - The item to present.
  - `type: PresentationType` - The presentation type (`sheet` or `fullScreenCover`).
  - `onDismiss: (() -> Void)?` - Optional closure to execute on dismiss.

#### Example Usage:
```swift
AppCoordinator.present(.count(0), as: .sheet())
AppCoordinator.present(.count(0), as: .fullScreenCover)
```

### `dismiss()`
Dismisses the currently presented item or the top-most route.

#### Example Usage:
```swift
AppCoordinator.dismiss()
```

### `pop() -> T?`
Dismisses the currently presented item or the top-most route and returns the dismissed item or route, if any.

- **Returns:** The dismissed item or route, if any.

#### Example Usage:
```swift
if let dismissedItem = AppCoordinator.pop() {
    print("Dismissed: \(dismissedItem)")
}
```

### `popToRoot()`
Pops all routes to return to the root.

#### Example Usage:
```swift
AppCoordinator.popToRoot()
```

### `popToLast(_:)`
Pops all routes until the specified route is reached.

- **Parameter:**
  - `route: T` - The route to pop to.

- **Note:** Prints an error if the specified route is not found in the path.

#### Example Usage:
```swift
AppCoordinator.popToLast(.home)
```

### `peek() -> T?`
Returns the top-most route without removing it from the stack. If the value does not exist, returns root.

- **Returns:** The top-most route, if any. Else returns root.

#### Example Usage:
```swift
if let topRoute = AppCoordinator.peek() {
    print("Top route: \(topRoute)")
}
```

### `view(root:) -> some View`
Creates a view with the specified root.

- **Parameter:**
  - `root: T` - The root view to set.

- **Returns:** A view displaying the root.

#### Example Usage:
```swift
let rootView = AppCoordinator.view(root: .home)
```

### `view() -> some View`
Creates a view with the Coordinators' root.

- **Returns:** A view displaying the root.

#### Example Usage:
```swift
let rootView = AppCoordinator.view()
```

# TabCoordinator

## TypeAlias

```swift
typealias AppTabCoordinator = NavigationCoordinator<T>
```

## Variables

### `tabs`
Returns the current tabs.

- **Returns:** An array representing the current tabs of type `[T]`.

### `selectedTab`
Returns the selected tab.

- **Returns:** The currently selected tab of type `T`.

#### Example Usage:
```swift
if let selectedTab = AppTabCoordinator.selectedTab {
    print("Selected tab: \(selectedTab)")
}
```

#### Example Usage:
```swift
let currentTabs = AppTabCoordinator.tabs
```

## Functions

### `select(tab:)`
Selects a specific tab.

- **Parameter:**
  - `tab: T` - The tab to select.

#### Example Usage:
```swift
AppTabCoordinator.select(tab: .profile)
```

### `view(selection:) -> some View`
Creates a view with all cases of the `TabRoutable` enum with the specified selected tab.

- **Parameter:**
  - `selection: T?` - The tab to select.

- **Returns:** A view displaying the tabs.

#### Example Usage:
```swift
let tabView = AppTabCoordinator.view(selection: .home)
```

### `view() -> some View`
Creates a view with all cases of the `TabRoutable` enum.

- **Returns:** A view displaying the tabs.

#### Example Usage:
```swift
let tabView = AppTabCoordinator.view()
```
