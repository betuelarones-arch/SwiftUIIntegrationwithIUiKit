import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = (scene as? UIWindowScene) {
            let window = UIWindow(windowScene: windowScene)
            let rootVC = UINavigationController(rootViewController: MenuViewController())
            window.rootViewController = rootVC
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Disconnection logic
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Updates when scene becomes active
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Resign active updates
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Updates upon foregrounding
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Updates upon entering background
    }
}
