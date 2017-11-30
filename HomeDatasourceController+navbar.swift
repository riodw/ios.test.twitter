//
//  HomeDatasourceController+navbar.swift
//  Project-1
//
//  Created by Riorden Weber on 9/26/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    func setupNavigationBarItems() {
        
        // Setup Left Nav Buttons
        setuptLeftNavItems()
        // Setup Rigth Nav Buttons
        setupRightNavItems()
        // Setup Remaining Nav Items
        setupRemainingNavItems()
        
        
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        // Set White
        navigationController?.navigationBar.backgroundColor = .white
        // Set to make white
        navigationController?.navigationBar.isTranslucent = false
        
        // Code To remove Bottom Line
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        // Make Line under top nav verry light
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setuptLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: followButton)
        ]
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: composeButton),
            UIBarButtonItem(customView: searchButton)
        ]
    }

}



