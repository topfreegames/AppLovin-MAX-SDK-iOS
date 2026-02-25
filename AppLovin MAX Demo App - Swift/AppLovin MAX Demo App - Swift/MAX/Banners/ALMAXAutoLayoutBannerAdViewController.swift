//
//  ALMAXAutoLayoutBannerAdViewController.swift
//  DemoApp-Swift
//
//  Created by Andrew Tian on 9/20/19.
//  Copyright © 2019 AppLovin. All rights reserved.
//

import AppLovinSDK
import UIKit

class ALMAXAutoLayoutBannerAdViewController: ALBaseAdViewController, MAAdViewAdDelegate, MAAdRevenueDelegate
{
    private let adView = MAAdView(adUnitIdentifier: "21dde131acbb89d9")
    
    // MARK: View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        adView.delegate = self
        adView.revenueDelegate = self
        
        adView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set background or background color for banners to be fully functional
        adView.backgroundColor = .black
        
        view.addSubview(adView)

        // Anchor the banner to the left, right, and top of the screen.
        adView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        adView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        adView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        adView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        adView.heightAnchor.constraint(equalToConstant: (UIDevice.current.userInterfaceIdiom == .pad) ? 90 : 50).isActive = true // Banner height on iPhone and iPad is 50 and 90, respectively
        
        // Load the first ad
        adView.loadAd()
    }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd) { logCallback() }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) { logCallback() }

    func didDisplay(_ ad: MAAd) { logCallback() }
    
    func didHide(_ ad: MAAd) { logCallback() }
    
    func didClick(_ ad: MAAd) { logCallback() }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) { logCallback() }
        
    // MARK: MAAdViewAdDelegate Protocol
    
    func didExpand(_ ad: MAAd) { logCallback() }
    
    func didCollapse(_ ad: MAAd) { logCallback() }
    
    // MARK: MAAdRevenueDelegate Protocol
    
    func didPayRevenue(for ad: MAAd)
    {
        logCallback()
        
        // Revenue tracking - integrate with your analytics service here if needed
        // Example: Revenue is available via ad.revenue
    }
}
