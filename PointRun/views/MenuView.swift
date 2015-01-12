//
//  MenuView.swift
//  PointRun
//
//  Created by Jack Cook on 8/4/14.
//  Copyright (c) 2014 CosmicByte. All rights reserved.
//

import UIKit

class MenuView: UIView {

    var opacityView: UIView!
    var statusbarView: UIView!
    var menuView: UIView!
    
    var statisticsButton: UIButton!
    var indicator: UIImageView!
    var checkImage: UIImageView!
    
    var device = UIScreen.mainScreen().bounds.size
    var statisticsShown = false
    
    var viewController: UIViewController!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init(frame: CGRectMake(0, 0, device.width, device.height))
        
        opacityView = UIView(frame: CGRectMake(0, 0, device.width, device.height))
        opacityView.backgroundColor = UIColor.blackColor()
        opacityView.alpha = 0.0
        
        let tgr = UITapGestureRecognizer(target: self, action: Selector("hide"))
        opacityView.addGestureRecognizer(tgr)
        
        
        statusbarView = UIView(frame: CGRectMake(-device.width, 0, device.width, 20))
        statusbarView.backgroundColor = UIColor(red: 0.09, green: 0.6, blue: 0.47, alpha: 1.00)
        
        
        menuView = UIView(frame: CGRectMake(-menuWidth, 20, menuWidth, device.height))
        menuView.backgroundColor = UIColor.whiteColor()
        
        statisticsButton = UIButton(frame: CGRectMake(0, 0, 87, 64))
        statisticsButton.setImage(UIImage(named: "element06.png"), forState: .Normal)
        statisticsButton.setImage(UIImage(named: "element07.png"), forState: .Highlighted)
        statisticsButton.addTarget(self, action: Selector("statisticsButtonEvent"), forControlEvents: .TouchDown)
        statisticsButton.addTarget(self, action: Selector("showStatistics"), forControlEvents: .AllTouchEvents)
        
        let statisticsImage = UIImageView(frame: CGRectMake(30, 21, 27, 22))
        statisticsImage.image = UIImage(named: "statistics.png")
        
        let achievementsButton = UIButton(frame: CGRectMake(87, 0, 86, 64))
        achievementsButton.setImage(UIImage(named: "element07.png"), forState: .Normal)
        achievementsButton.setImage(UIImage(named: "element06.png"), forState: .Highlighted)
        achievementsButton.addTarget(self, action: Selector("showAchievements"), forControlEvents: .TouchUpInside)
        
        let achievementsImage = UIImageView(frame: CGRectMake(35.5, 21, 15, 22))
        achievementsImage.image = UIImage(named: "medal.png")
        
        let leaderboardButton = UIButton(frame: CGRectMake(173, 0, 87, 64))
        leaderboardButton.setImage(UIImage(named: "element06.png"), forState: .Normal)
        leaderboardButton.setImage(UIImage(named: "element07.png"), forState: .Highlighted)
        leaderboardButton.addTarget(self, action: Selector("showLeaderboards"), forControlEvents: .TouchUpInside)
        
        let leaderboardImage = UIImageView(frame: CGRectMake(28.5, 21, 30, 22))
        leaderboardImage.image = UIImage(named: "list.png")
        
        indicator = UIImageView(frame: CGRectMake(33, 62.5, 21, 8))
        indicator.image = UIImage(named: "element03.png")
        
        statisticsButton.addSubview(statisticsImage)
        achievementsButton.addSubview(achievementsImage)
        leaderboardButton.addSubview(leaderboardImage)
        
        menuView.addSubview(statisticsButton)
        menuView.addSubview(achievementsButton)
        menuView.addSubview(leaderboardButton)
        
        self.addSubview(opacityView)
        self.addSubview(statusbarView)
        self.addSubview(menuView)
    }
    
    func show() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.opacityView.alpha = 0.5
            self.statusbarView.frame = CGRectMake(0, 0, self.device.width, 20)
            self.menuView.frame = CGRectMake(0, 20, menuWidth, self.menuView.frame.height - 20)
        }
    }
    
    func hide() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.opacityView.alpha = 0.0
            self.statusbarView.frame = CGRectMake(-self.device.width, 0, self.device.width, 20)
            self.menuView.frame = CGRectMake(-menuWidth, 20, menuWidth, self.menuView.frame.height - 20)
        }) { (Bool) -> Void in
            self.removeFromSuperview()
        }
    }
    
    func statisticsButtonEvent() {
        switch statisticsButton.state {
        case UIControlState.Highlighted:
            indicator.image = UIImage(named: "element21.png")
        default:
            indicator.image = UIImage(named: "element03.png")
        }
    }
    
    func showSettings() {
        let backHeight: CGFloat = 64
        let backImage = UIImageView(frame: CGRectMake(0, 64, menuWidth, backHeight))
        backImage.image = UIImage(named: "element13.png")
        
        let backButton = UIButton(frame: CGRectMake(10, 74, menuWidth - 20, backHeight - 20))
        backButton.setImage(UIImage(named: "element08.png"), forState: .Normal)
        backButton.setImage(UIImage(named: "element20.png"), forState: .Highlighted)
        backButton.addTarget(self, action: Selector("backButton"), forControlEvents: .TouchUpInside)
        
        let iconHeight: CGFloat = 18
        let backIcon = UIImageView(frame: CGRectMake(16, (backButton.frame.size.height - iconHeight) / 2, 21, iconHeight))
        backIcon.image = UIImage(named: "back.png")
        
        let backText = UILabel()
        backText.text = "Return to mode select"
        backText.font = UIFont(name: "Open Sans", size: 14.0)
        backText.textColor = UIColor.whiteColor()
        backText.sizeToFit()
        backText.frame = CGRectMake(backIcon.frame.origin.x + backIcon.frame.size.width + 10, (backButton.frame.size.height - backText.frame.size.height) / 2, backText.frame.size.width, backText.frame.size.height)
        
        backButton.addSubview(backIcon)
        backButton.addSubview(backText)
        
        let optionImage = UIImageView(frame: CGRectMake(0, 128, menuWidth, 64))
        optionImage.image = UIImage(named: "element13.png")
        
        let optionLabel = UILabel()
        optionLabel.text = "Map display"
        optionLabel.font = UIFont(name: "Open Sans", size: 14.0)
        optionLabel.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1.00)
        optionLabel.sizeToFit()
        optionLabel.frame = CGRectMake(12, 142, 128, optionLabel.frame.size.height)
        
        let streetsButton = UIButton(frame: CGRectMake(10, 174, menuWidth - 20, 42))
        streetsButton.setImage(UIImage(named: "element22.png"), forState: .Normal)
        streetsButton.setImage(UIImage(named: "element23.png"), forState: .Highlighted)
        streetsButton.addTarget(self, action: Selector("streetsButton"), forControlEvents: .TouchUpInside)
        
        let streetsLabel = UILabel()
        streetsLabel.text = "Streets"
        streetsLabel.font = UIFont(name: "Open Sans", size: 14.0)
        streetsLabel.textColor = UIColor(red: 0.37, green: 0.37, blue: 0.37, alpha: 1.00)
        streetsLabel.sizeToFit()
        streetsLabel.frame = CGRectMake(56, (streetsButton.frame.size.height - streetsLabel.frame.size.height) / 2, streetsLabel.frame.size.width, streetsLabel.frame.size.height)
        
        streetsButton.addSubview(streetsLabel)
        
        let satelliteButton = UIButton(frame: CGRectMake(10, 228, menuWidth - 20, 42))
        satelliteButton.setImage(UIImage(named: "element22.png"), forState: .Normal)
        satelliteButton.setImage(UIImage(named: "element23.png"), forState: .Highlighted)
        satelliteButton.addTarget(self, action: Selector("satelliteButton"), forControlEvents: .TouchUpInside)
        
        let satelliteLabel = UILabel()
        satelliteLabel.text = "Satellite"
        satelliteLabel.font = UIFont(name: "Open Sans", size: 14.0)
        satelliteLabel.textColor = UIColor(red: 0.37, green: 0.37, blue: 0.37, alpha: 1.00)
        satelliteLabel.sizeToFit()
        satelliteLabel.frame = CGRectMake(56, (satelliteButton.frame.size.height - satelliteLabel.frame.size.height) / 2, satelliteLabel.frame.size.width, satelliteLabel.frame.size.height)
        
        satelliteButton.addSubview(satelliteLabel)
        
        let hybridButton = UIButton(frame: CGRectMake(10, 282, menuWidth - 20, 42))
        hybridButton.setImage(UIImage(named: "element22.png"), forState: .Normal)
        hybridButton.setImage(UIImage(named: "element23.png"), forState: .Highlighted)
        hybridButton.addTarget(self, action: Selector("hybridButton"), forControlEvents: .TouchUpInside)
        
        let hybridLabel = UILabel()
        hybridLabel.text = "Hybrid"
        hybridLabel.font = UIFont(name: "Open Sans", size: 14.0)
        hybridLabel.textColor = UIColor(red: 0.37, green: 0.37, blue: 0.37, alpha: 1.00)
        hybridLabel.sizeToFit()
        hybridLabel.frame = CGRectMake(56, (hybridButton.frame.size.height - hybridLabel.frame.size.height) / 2, hybridLabel.frame.size.width, hybridLabel.frame.size.height)
        
        hybridButton.addSubview(hybridLabel)
        
        let terrainButton = UIButton(frame: CGRectMake(10, 336, menuWidth - 20, 42))
        terrainButton.setImage(UIImage(named: "element22.png"), forState: .Normal)
        terrainButton.setImage(UIImage(named: "element23.png"), forState: .Highlighted)
        terrainButton.addTarget(self, action: Selector("terrainButton"), forControlEvents: .TouchUpInside)
        
        let terrainLabel = UILabel()
        terrainLabel.text = "Terrain"
        terrainLabel.font = UIFont(name: "Open Sans", size: 14.0)
        terrainLabel.textColor = UIColor(red: 0.37, green: 0.37, blue: 0.37, alpha: 1.00)
        terrainLabel.sizeToFit()
        terrainLabel.frame = CGRectMake(56, (terrainButton.frame.size.height - terrainLabel.frame.size.height) / 2, terrainLabel.frame.size.width, terrainLabel.frame.size.height)
        
        terrainButton.addSubview(terrainLabel)
        
        let checkY = CGFloat(174 + (54 * defaults.doubleForKey("mapType")))
        checkImage = UIImageView()
        checkImage.image = UIImage(named: "element24.png")
        checkImage.frame = CGRectMake(10, checkY, 42, 42)
        
        let checkIcon = UIImageView(frame: CGRectMake((checkImage.frame.size.width - 19) / 2, (checkImage.frame.size.height - 16) / 2, 19, 16))
        checkIcon.image = UIImage(named: "checkmark.png")
        
        checkImage.addSubview(checkIcon)
        
        menuView.addSubview(backImage)
        menuView.addSubview(backButton)
        menuView.addSubview(optionImage)
        menuView.addSubview(optionLabel)
        menuView.addSubview(streetsButton)
        menuView.addSubview(satelliteButton)
        menuView.addSubview(hybridButton)
        menuView.addSubview(terrainButton)
        menuView.addSubview(checkImage)
    }
    
    func backButton() {
        nc.postNotificationName(backNotification, object: nil)
    }
    
    func streetsButton() {
        defaults.setDouble(0, forKey: "mapType")
        let checkY = CGFloat(174 + (54 * defaults.doubleForKey("mapType")))
        checkImage.frame = CGRectMake(10, checkY, 42, 42)
        nc.postNotificationName(mapChangedNotification, object: nil)
    }
    
    func satelliteButton() {
        defaults.setDouble(1, forKey: "mapType")
        let checkY = CGFloat(174 + (54 * defaults.doubleForKey("mapType")))
        checkImage.frame = CGRectMake(10, checkY, 42, 42)
        nc.postNotificationName(mapChangedNotification, object: nil)
    }
    
    func hybridButton() {
        defaults.setDouble(2, forKey: "mapType")
        let checkY = CGFloat(174 + (54 * defaults.doubleForKey("mapType")))
        checkImage.frame = CGRectMake(10, checkY, 42, 42)
        nc.postNotificationName(mapChangedNotification, object: nil)
    }
    
    func terrainButton() {
        defaults.setDouble(3, forKey: "mapType")
        let checkY = CGFloat(174 + (54 * defaults.doubleForKey("mapType")))
        checkImage.frame = CGRectMake(10, checkY, 42, 42)
        nc.postNotificationName(mapChangedNotification, object: nil)
    }
    
    func showStatistics() {
        menuView.addSubview(indicator)
        indicator.image = UIImage(named: "element03.png")
        
        if statisticsShown {return}
        statisticsShown = true
        
        var height = 46
        for i in 0...6 {
            let statisticCell = UIImageView(frame: CGRectMake(0, CGFloat(64 + (i * height)), menuWidth, CGFloat(height)))
            statisticCell.image = UIImage(named: "element13.png")
            menuView.insertSubview(statisticCell, belowSubview: indicator)
            
            let name = UILabel()
            let score = UILabel()
            
            switch i {
            case 0:
                let heading = UILabel()
                heading.text = "Statistics"
                heading.font = UIFont(name: "Open Sans", size: 18.0)
                heading.textColor = UIColor(red: 0.1, green: 0.71, blue: 0.56, alpha: 1.00)
                heading.sizeToFit()
                heading.frame = CGRectMake(16, (statisticCell.frame.size.height - heading.frame.size.height) / 2, heading.frame.size.width, heading.frame.size.height)
                statisticCell.addSubview(heading)
            case 1:
                name.text = "Game wins"
                score.text = defaults.doubleForKey(gameWinsStatistic).toString()
            case 2:
                let time = defaults.doubleForKey(timePlayedStatistic)
                if time < 60 {
                    name.text = "Seconds played"
                    score.text = time.toString()
                } else if time >= 60 && time < 3600 {
                    name.text = "Minutes played"
                    score.text = (time / 60).toString()
                } else if time >= 3600 {
                    name.text = "Hours played"
                    score.text = (time / 3600).toString()
                }
            case 3:
                name.text = "Meters travelled"
                score.text = defaults.doubleForKey(metersTravelledStatistic).toString()
            case 4:
                name.text = "Pins collected"
                score.text = defaults.doubleForKey(pinsCollectedStatistic).toString()
            case 5:
                name.text = "Points earned"
                score.text = defaults.doubleForKey(pointsEarnedStatistic).toString()
            case 6:
                name.text = "Poison pins"
                score.text = defaults.doubleForKey(poisonPinsStatistic).toString()
            default:
                break
            }
            
            if i != 0 {
                name.font = UIFont(name: "Open Sans", size: 14.0)
                name.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1.00)
                name.sizeToFit()
                name.frame = CGRectMake(16, (statisticCell.frame.size.height - name.frame.size.height) / 2, name.frame.size.width, name.frame.size.height)
                statisticCell.addSubview(name)
                
                score.font = UIFont(name: "Open Sans", size: 15.0)
                score.textColor = UIColor(red: 0.1, green: 0.7, blue: 0.57, alpha: 1.00)
                score.textAlignment = NSTextAlignment.Right
                score.sizeToFit()
                score.frame = CGRectMake(menuWidth / 2, (statisticCell.frame.size.height - score.frame.size.height) / 2, (menuWidth / 2) - 16, score.frame.size.height)
                statisticCell.addSubview(score)
            }
        }
        
        let resetHeight: CGFloat = 64
        let resetImage = UIImageView(frame: CGRectMake(0, device.height - 20 - resetHeight, menuWidth, resetHeight))
        resetImage.image = UIImage(named: "element13.png")
        
        let resetButton = UIButton(frame: CGRectMake(10, device.height - 20 - resetHeight + 10, menuWidth - 20, resetHeight - 20))
        resetButton.setImage(UIImage(named: "element08.png"), forState: .Normal)
        resetButton.setImage(UIImage(named: "element20.png"), forState: .Highlighted)
        resetButton.addTarget(self, action: Selector("resetStatistics"), forControlEvents: .TouchUpInside)
        
        let resetText = UILabel()
        resetText.text = "Reset all stats"
        resetText.font = UIFont(name: "Open Sans", size: 14.0)
        resetText.textColor = UIColor.whiteColor()
        resetText.sizeToFit()
        resetText.frame = CGRectMake((resetButton.frame.size.width - resetText.frame.size.width) / 2, (resetButton.frame.size.height - resetText.frame.size.height) / 2, resetText.frame.size.width, resetText.frame.size.height)
        
        resetButton.addSubview(resetText)
        
        menuView.addSubview(resetImage)
        menuView.addSubview(resetButton)
    }
    
    func showAchievements() {
        nc.postNotificationName(achievementNotification, object: nil)
    }
    
    func showLeaderboards() {
        nc.postNotificationName(leaderboardNotification, object: nil)
    }
    
    func resetStatistics() {
        let alert = UIAlertController(title: "Reset", message: "Are you sure you want to reset your statistics?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "No", style: .Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .Destructive, handler: { (alertAction) -> Void in
            defaults.setDouble(0, forKey: gameWinsStatistic)
            defaults.setDouble(0, forKey: timePlayedStatistic)
            defaults.setDouble(0, forKey: metersTravelledStatistic)
            defaults.setDouble(0, forKey: pinsCollectedStatistic)
            defaults.setDouble(0, forKey: pointsEarnedStatistic)
            defaults.setDouble(0, forKey: poisonPinsStatistic)
            
            for view in self.menuView.subviews {
                if view is UIImageView {
                    for label in view.subviews {
                        if label is UILabel {
                            // It works, so...
                            if label.frame.origin.x > 100 {
                                (label as UILabel).text = "0"
                            }
                        }
                    }
                }
            }
        }))
        
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
}
