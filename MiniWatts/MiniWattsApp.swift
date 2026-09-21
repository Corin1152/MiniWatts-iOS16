import SwiftUI

@main
struct MiniWattsApp: App {
    // iOS 16 compatibility: `ObservableObject` instances are held in
    // `@StateObject` and injected with `environmentObject` instead of the
    // Observation-based `.environment(_:)`.
    @StateObject private var monitor = PowerMonitor()
    /// One per process, and alive for as long as the app is: the layer Picture in
    /// Picture draws from cannot come and go with a settings sheet.
    @StateObject private var floatingMeter = FloatingMeterController()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(monitor)
                .environmentObject(floatingMeter)
        }
    }
}
