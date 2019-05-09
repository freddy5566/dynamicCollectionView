//
//  DynamicCell.swift
//  DynamicCollectionView
//
//  Created by Jamfly on 2019/5/10.
//  Copyright © 2019 jamfly. All rights reserved.
//

import UIKit

final class DynamicCell: UICollectionViewCell {

  // MARK: - Properties
  private lazy var width: NSLayoutConstraint = {
    let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
    width.isActive = true
    return width
  }()

  private lazy var label: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var customView: UIView = {
    let customView = UIView()
    customView.backgroundColor = .green
    customView.translatesAutoresizingMaskIntoConstraints = false
    return customView
  }()

  // MARK: - Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.backgroundColor = UIColor.red
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Public Methods

  public func configCell(with text: String) {
    label.text = text
  }

  // MARK: - Private Methods
  private func setupViews() {
    contentView.addSubview(customView)
    customView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    customView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    customView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    customView.widthAnchor.constraint(equalToConstant: 100).isActive = true

    contentView.addSubview(label)
    label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    label.leftAnchor.constraint(equalTo: customView.rightAnchor, constant: 10).isActive = true
    label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

    if let lastSubview = contentView.subviews.last {
      contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
    }
  }

}

// MARK: - systemLayoutSizeFitting
extension DynamicCell {

  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
    width.constant = bounds.size.width
    return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
  }

}
