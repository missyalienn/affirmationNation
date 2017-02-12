//
//  LoginView.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/12/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class LoginView: UIView {
    
    //MARK: Properties 
    lazy var topView = UIView()
    lazy var middleView = UIView()
    lazy var loginStackView = UIStackView()
    
    lazy var titleLabel = UILabel()
    lazy var emailField =  UITextField()
    lazy var passwordField = UITextField()
    
    lazy var loginButton = UIButton()
    lazy var signupButton = UIButton()
    lazy var forgotPasswordButton = UIButton()
    
    lazy var bottomView = UIView()
    lazy var noLoginStackView = UIStackView()
    lazy var createAccountButton = UIButton()
    lazy var skipButton = UIButton()
    
    //MARK Initialization 
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        configure()
        constrain()
    }
    
    
    // MARK: Setup
    private func configure() {
        topView.backgroundColor = UIColor.themeSunshine
        middleView.backgroundColor = UIColor.themeCreamsicle
        bottomView.backgroundColor = UIColor.themeCoral
        
        
        titleLabel.text = "affirmation deck"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.themeOversizeThin
        titleLabel.textColor = UIColor.white
        
        emailField.placeholder = "Email"
        emailField.font = UIFont.themeMediumThin
        emailField.textColor = UIColor.white
        
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.font = UIFont.themeMediumThin
        passwordField.textColor = UIColor.white
        
        loginButton.backgroundColor = UIColor.white
        loginButton.contentEdgeInsets = UIEdgeInsetsMake(11, 16, 11, 16)
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = UIFont.themeSmallBold
        loginButton.setTitleColor(UIColor.themePurple, for: .normal)
        loginButton.layer.cornerRadius = 20
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.themeSmallBold
        forgotPasswordButton.setTitleColor(UIColor.white, for: .normal)
        
        loginStackView.addArrangedSubview(emailField)
        loginStackView.addArrangedSubview(passwordField)
        loginStackView.addArrangedSubview(loginButton)
        loginStackView.addArrangedSubview(forgotPasswordButton)
        
        loginStackView.axis = .vertical
        loginStackView.distribution = .equalCentering
        loginStackView.alignment = .center
        
        createAccountButton.setTitle("Create account", for: .normal)
        createAccountButton.titleLabel?.font = UIFont.themeTinyBold
        createAccountButton.setTitleColor(UIColor.white, for: .normal)
        
        skipButton.setTitle("Skip for now", for: .normal)
        skipButton.titleLabel?.font = UIFont.themeTinyBold
        skipButton.setTitleColor(UIColor.white, for: .normal)
        
        noLoginStackView.addArrangedSubview(createAccountButton)
        noLoginStackView.addArrangedSubview(skipButton)
        noLoginStackView.axis = .vertical
        noLoginStackView.spacing = 3

        
    }

    
    
    
    
    //MARK: Constraints
    private func constrain() {
        
        //TopView
        addSubview(topView)
        topView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(2.5)
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}

