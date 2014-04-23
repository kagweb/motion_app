class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @slider = JASidePanelController.alloc.init
    @slider.leftPanel = MenuViewController.alloc.init
    @slider.centerPanel = UINavigationController.alloc.initWithRootViewController(CenterViewController.alloc.init)

    @window.rootViewController = @slider;
    @window.makeKeyAndVisible

    true
  end
end
