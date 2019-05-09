//
//  DynamicCollectionViewController.swift
//  DynamicCollectionView
//
//  Created by Jamfly on 2019/5/10.
//  Copyright © 2019 jamfly. All rights reserved.
//

import UIKit

final class DynamicCollectionViewController: UICollectionViewController {

  // MARK: - Properties
  private let data = [
    "Voters encountering Elizabeth Warren on the presidential campaign trail these days often seem surprised. After a packed gathering at an elementary school in Concord, N.H., in April, a 40-something woman told me she had expected Warren to be more like Hillary Clinton but found them miles apart.",
    "A college student who caught Warren’s speech in Hanover said he was perplexed to learn that a woman once described by the U.S. Chamber of Commerce’s political director as a “threat to free enterprise” in fact believes in entrepreneurship and markets. And at an event in a Portsmouth high school cafeteria, a retired teacher told me he’d heard Warren was a “Ted Cruz–like partisan” but instead found her charming. “She seems like a real doll,” he shrugged. “Can I say that?”",
    "\"O.K., O.K., I can answer this,\" she said.",
    "Which might as well be a motto for Warren’s presidential campaign. She has set herself apart in a Democratic field of more than 20 candidates by offering more than a dozen complex policy proposals designed to address an array of problems, from unaffordable housing and child care to the overwhelming burden of student debt. Her anticorruption initiative would target the Washington swamp, and her anti­trust measures would transform Silicon Valley. On May 8 she unveiled a $100 billion plan to fight the opioid crisis. This flurry of white papers, often rendered in fine detail, appears to suggest a technocratic approach to governing. But in fact, her ­vision, taken as a whole, is closer to a populist political revolution.",
    "It’s an audacious bet in the Donald Trump era. Voters tend to tell pollsters they prioritize policy over personality. But they said that in 2016 too, when Clinton’s detailed agenda was no match for Trump’s simple slogans and schoolyard nicknames. As her Democratic competitors offer enticing promises largely devoid of specifics, Warren insists on ­talking nuts and bolts. In her stump speech, she describes the mechanics of a tax that would fund her universal child-care plan, to pick just one example among many.",
    "Warren greets supporters at a house party in Iowa Falls on May 3."
  ]

  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    let width = UIScreen.main.bounds.size.width
    layout.estimatedItemSize = CGSize(width: width, height: 10)
    return layout
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.register(DynamicCell.self, forCellWithReuseIdentifier: "DynamicCellID")
    collectionView.collectionViewLayout = layout
  }

}

// MARK: - UICollectionViewDataSource
extension DynamicCollectionViewController {

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "DynamicCellID",
      for: indexPath
      ) as? DynamicCell else {
      return UICollectionViewCell()
    }
    cell.configCell(with: data[indexPath.item])
    return cell
  }

}

// MARK: - UITraitEnvironment
extension DynamicCollectionViewController {

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
    super.traitCollectionDidChange(previousTraitCollection)
  }

  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
    layout.invalidateLayout()
    super.viewWillTransition(to: size, with: coordinator)
  }

}

