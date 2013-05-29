class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
    buildWebView
    loadRubyistokei
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 320]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
  end

  def buildWebView
    @web_view = WebView.alloc.initWithFrame(NSMakeRect(0, 0, 480, 320))
    @web_view.setAutoresizingMask(NSViewWidthSizable | NSViewHeightSizable)
    @mainWindow.contentView.addSubview(@web_view)
  end

  def loadRubyistokei
    url = "http://rubyistokei.herokuapp.com"
    request = NSURLRequest.alloc.initWithURL(NSURL.URLWithString(url));
    @web_view.mainFrame.loadRequest(request)
  end
end
