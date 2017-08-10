import AppKit
import SwiftNeoVim
var sharedPlugin: XNeovim?

class XNeovim: NSObject {

  var bundle: Bundle

  class func pluginDidLoad(_ bundle: Bundle) {
    print("🔌XNeovim|✅: pluginDidLoad called.")
    guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
      print("🔌XNeovim|⛔️: Bundle identifier is nil. Not loading plugin.")
      return
    }
    guard bundleIdentifier == "com.apple.dt.Xcode" else {
      print("🔌XNeovim|⛔️: Bundle identifier doesn't match 'com.apple.dt.Xcode'. Not loading plugin.")
      return
    }
    if sharedPlugin == nil {
      sharedPlugin = XNeovim(bundle: bundle)
      print("🔌XNeovim|✅: Set sharedPlugin variable.")
    }
  }

  init(bundle: Bundle) {
    self.bundle = bundle
    super.init()
    // Add an observer so we get notified when Xcode is actually loaded
    NotificationCenter.default.addObserver(self, selector: #selector(self.xcodeDidFinishLaunching), name: NSNotification.Name.NSApplicationDidFinishLaunching, object: nil)
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  private dynamic func xcodeDidFinishLaunching() {
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NSApplicationDidFinishLaunching, object: nil)
    initializePlugin()
  }

  private func initializePlugin() {
    configureMenuItems()
    let version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "⛔️ Unknown"
    print("🔌XNeovim|✅: Plugin initialized!")
    print("🔌XNeovim|✅: Plugin Version \(version)")
    print("🔌XNeovim|✅: SwiftNeoVim Framework Version \(SwiftNeoVimVersionNumber)")
  }

  private func configureMenuItems() {
    guard let mainMenu = NSApp.mainMenu else { return }
    guard let editItem = mainMenu.item(withTitle: "Edit") else { return }
    guard let submenu = editItem.submenu else { return }

    let pluginMenuItem = NSMenuItem(title:"🔌 XNeovim", action: nil, keyEquivalent:"")

    submenu.addItem(pluginMenuItem)

    let pluginMenu = NSMenu(title: "🔌 XNeovim")
    let aboutMenuItem = NSMenuItem(title: "About", action: #selector(self.aboutMenuAction), keyEquivalent: "")
    aboutMenuItem.target = self

    pluginMenu.addItem(aboutMenuItem)

    submenu.setSubmenu(pluginMenu, for: pluginMenuItem)
  }

  dynamic private func aboutMenuAction() {
    let version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "⛔️ Unknown"

    let alert = NSAlert()
    alert.messageText = "XNeovim version \(version)"
    alert.alertStyle = .informational
    alert.runModal()
  }
}
