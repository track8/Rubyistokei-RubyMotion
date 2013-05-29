class AppDelegate
  def buildMenu
    @mainMenu = NSMenu.new

    appName = NSBundle.mainBundle.infoDictionary['CFBundleName']
    addMenu(appName) do
      addItemWithTitle("About #{appName}", action: 'orderFrontStandardAboutPanel:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Preferences', action: 'openPreferences:', keyEquivalent: ',')
      addItem(NSMenuItem.separatorItem)
      servicesItem = addItemWithTitle('Services', action: nil, keyEquivalent: '')
      NSApp.servicesMenu = servicesItem.submenu = NSMenu.new
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle("Hide #{appName}", action: 'hide:', keyEquivalent: 'h')
      item = addItemWithTitle('Hide Others', action: 'hideOtherApplications:', keyEquivalent: 'H')
      item.keyEquivalentModifierMask = NSCommandKeyMask|NSAlternateKeyMask
      addItemWithTitle('Show All', action: 'unhideAllApplications:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle("Quit #{appName}", action: 'terminate:', keyEquivalent: 'q')
    end
    NSApp.mainMenu = @mainMenu
  end

  private

  def addMenu(title, &b)
    item = createMenu(title, &b)
    @mainMenu.addItem item
    item
  end

  def createMenu(title, &b)
    menu = NSMenu.alloc.initWithTitle(title)
    menu.instance_eval(&b) if b
    item = NSMenuItem.alloc.initWithTitle(title, action: nil, keyEquivalent: '')
    item.submenu = menu
    item
  end
end
