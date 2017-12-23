//
//  OnboardingViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-18.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

private let cellIdentifer = "OnboardingCell"

class OnboardingViewController: UIViewController {
    
    private let onboardingImages: [UIImage] = [#imageLiteral(resourceName: "growth_onboarding"), #imageLiteral(resourceName: "customers_onboarding"), #imageLiteral(resourceName: "orders_onboarding"), #imageLiteral(resourceName: "store_onboarding"), #imageLiteral(resourceName: "white_Image_onboarding")]
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(OnboardingCell.self, forCellWithReuseIdentifier: cellIdentifer)
        return cv
    }()
    
    private lazy var pageControl:UIPageControl = {
        let pgControl = UIPageControl()
        pgControl.numberOfPages = 5
        pgControl.currentPageIndicatorTintColor = UIColor.themeIndigoDark()
        pgControl.pageIndicatorTintColor = UIColor.themeLightIndigo()
        return pgControl
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.backgroundColor = .white
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.backgroundColor = .white
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "next_button"), for: .normal)
        return button
    }()
    
    private lazy var dummyNextButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupSkipButtonAnimation()
    }
   
    @objc
    private func nextButtonTapped(_ button: UIButton) {
        if pageControl.currentPage == 4 {
            dismissViews()
            return
        }
        
        if pageControl.currentPage == (3) {
            // do something
            //showLoginViewController()
            perform(#selector(showLoginViewController), with: nil, afterDelay: 0.5)
        }
        
        let item = pageControl.currentPage + 1
        let indexPath = IndexPath(item: item, section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    @objc
    private func showLoginViewController() {
        let storyBoard = UIStoryboard(name: "LoginAndSignup", bundle: nil)
//        guard let navVC = storyBoard.instantiateViewController(withIdentifier: "LoginNavVC") as? UINavigationController else {
//            fatalError("Failure to instantiate Navigation Controller with identifer of LoginNavVC")
//        }
//        guard let _ = navVC.viewControllers.first as? LoginViewController else {
//            fatalError("Failure to instantiate View Controller with identifer of LoginVC")
//        }
        guard let welcomeLoginVC = storyBoard.instantiateViewController(withIdentifier: "WelcomeLoginVC") as? WelcomeLoginandSignupVC else {
            fatalError("Failure to instantiate View Controller with identifer of WelcomeLoginVC")
        }
        present(welcomeLoginVC, animated: true, completion: nil)
    }

    private func dismissViews() {
        
    }
    
    private func setupSkipButtonAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.autoreverse, .curveLinear, .repeat], animations: { [unowned self] in
            self.nextButton.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            self.nextButton.transform = CGAffineTransform.identity
            }, completion: nil)
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        collectionView.anchorConstraints(topAnchor: view.topAnchor, topConstant: 0, leftAnchor: view.leftAnchor, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: 0, bottomAnchor: view.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        view.addSubview(pageControl)
        pageControl.anchorCenterConstraints(centerXAnchor: view.centerXAnchor, xConstant: 0, centerYAnchor: nil, yConstant: 0)
        pageControl.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: nil, rightConstant: 0, bottomAnchor: view.bottomAnchor, bottomConstant: (-view.frame.height / 4) + 30, heightConstant: 0, widthConstant: 0)
        
        view.addSubview(nextButton)
        nextButton.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: -20, bottomAnchor: view.bottomAnchor, bottomConstant: -20, heightConstant: 70, widthConstant: 70)
        
        view.addSubview(dummyNextButton)
         dummyNextButton.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: -20, bottomAnchor: view.bottomAnchor, bottomConstant: -20, heightConstant: 70, widthConstant: 70)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let indexPath = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = indexPath
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingImages.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! OnboardingCell
        cell.imageView.image = onboardingImages[indexPath.item]
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}


















