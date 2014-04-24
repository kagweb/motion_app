# coding: utf-8
class MenuViewController < UITableViewController
  def viewDidLoad
    super

    @menus = ['メニューA', 'メニューB', 'メニューC']

    # self.view.backgroundColor = UIColor.redColor

    # @label = UILabel.alloc.init
    # @label.font = UIFont.boldSystemFontOfSize(20.0)
    # @label.textColor = UIColor.whiteColor
    # @label.backgroundColor = UIColor.clearColor
    # @label.text = "Left Panel"
    # @label.sizeToFit
    # @label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin
    # self.view.addSubview(@label)

    # @hide = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    # @hide.frame = CGRectMake(20.0, 20.0, 200.0, 40.0)
    # @hide.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    # @hide.setTitle("Hide Center", forState: UIControlStateNormal)
    # @hide.addTarget(self, action: '_hideTapped:', forControlEvents: UIControlEventTouchUpInside)
    # self.view.addSubview(@hide)

    # @show = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    # @show.frame = @hide.frame
    # @show.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    # @show.setTitle("Show Center", forState:UIControlStateNormal)
    # @show.addTarget(self, action: '_showTapped:', forControlEvents: UIControlEventTouchUpInside)
    # @show.hidden = true
    # self.view.addSubview(@show)

    # @removeRightPanel = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    # @removeRightPanel.frame = CGRectMake(20.0, 70.0, 200.0, 40.0)
    # @removeRightPanel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    # @removeRightPanel.setTitle("Remove Right Panel", forState: UIControlStateNormal)
    # @removeRightPanel.addTarget(self, action: '_removeRightPanelTapped:', forControlEvents: UIControlEventTouchUpInside)
    # self.view.addSubview(@removeRightPanel)

    # @addRightPanel = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    # @addRightPanel.frame = @removeRightPanel.frame
    # @addRightPanel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    # @addRightPanel.setTitle("Add Right Panel", forState: UIControlStateNormal)
    # @addRightPanel.addTarget(self, action: '_addRightPanelTapped:', forControlEvents: UIControlEventTouchUpInside)
    # @addRightPanel.hidden = true
    # self.view.addSubview(@addRightPanel)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @menus.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    menu = tableView.dequeueReusableCellWithIdentifier('menu') ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:'menu')
    menu.accessoryType  = UITableViewCellAccessoryDisclosureIndicator
    menu.textLabel.font = UIFont.boldSystemFontOfSize(14)
    menu.textLabel.text = @menus[indexPath.row]
    return menu
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    # 選択されたメニューに応じてセンターパネル切替
    case (indexPath.row)
    when 0
      self.sidePanelController.centerPanel = UINavigationController.alloc.initWithRootViewController(CenterViewController.alloc.init)
    when 1
      self.sidePanelController.centerPanel = UINavigationController.alloc.initWithRootViewController(CenterViewController.alloc.init)
    end
  end

  #pragma mark - Button Actions

  def _hideTapped(sender)
    self.sidePanelController.setCenterPanelHidden(true, animated: true, duration: 0.2)
    @hide.hidden = true
    @show.hidden = false
  end

  def _showTapped(sender)
    self.sidePanelController.setCenterPanelHidden(false, animated: true, duration: 0.2)
    @hide.hidden = false
    @show.hidden = true
  end

  def _removeRightPanelTapped(sender)
    self.sidePanelController.rightPanel = nil
    @removeRightPanel.hidden = true
    @addRightPanel.hidden = false
  end

  def _addRightPanelTapped(sender)
    self.sidePanelController.rightPanel = RightViewController.alloc.init
    @removeRightPanel.hidden = false
    @addRightPanel.hidden = true
  end
end
