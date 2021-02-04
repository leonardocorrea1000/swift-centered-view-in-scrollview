//
//  ViewControllerView.swift
//  CenteredViewInScrollView
//
//  Created by Jose Correa on 02/02/21.
//

import Foundation
import UIKit

class ViewControllerView: UIView {
    
    let navBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        return $0
    } (UIView())
    
    let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    } (UIScrollView())
    
    let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
        return $0
    } (UIView())
    
    let centeredView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
        return $0
    } (UIStackView())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "Title title titling"
        return $0
    } (UILabel())
    
    let bottomLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "Bottom bottom bottomling"
        return $0
    } (UILabel())
    
    let messageLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's s sdfsdfsdf dfsdfsdfsdfds \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem. \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "
        return $0
    } (UILabel())
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubViews()
        addConstraints()
    }
    
    func addSubViews() {
        addSubview(navBar)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(centeredView)
        
        centeredView.addArrangedSubview(titleLabel)
        centeredView.addArrangedSubview(messageLabel)
        centeredView.addArrangedSubview(bottomLabel)
    }
    
    func addConstraints() {
        setupNavBarConstraints()
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupCenteredViewConstraints()
    }
    
    private func setupNavBarConstraints() {
        NSLayoutConstraint.activate([
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.topAnchor.constraint(equalTo: topAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 44)
        ])
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupContentViewConstraints() {
        let contentViewHeight = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0)
        contentViewHeight.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentViewHeight,
        ])
    }
    
    private func setupCenteredViewConstraints() {
        NSLayoutConstraint.activate([
            centeredView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            centeredView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            centeredView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            centeredView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            centeredView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
}
