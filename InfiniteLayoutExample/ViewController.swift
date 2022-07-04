//
//  ViewController.swift
//  InfiniteLayoutExample
//
//  Created by iMac on 2022/07/04.
//

import UIKit
import SnapKit
import InfiniteLayout

class ViewController: UIViewController {
    private lazy var collectionView: InfiniteCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        let collectionView = InfiniteCollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.infiniteDelegate = self
        collectionView.register(
            TestCollectionViewCell.self,
            forCellWithReuseIdentifier: TestCollectionViewCell.identifier
        )
//        collectionView.isPagingEnabled = true
        collectionView.isItemPagingEnabled = true

        return collectionView
    }()

    private let mockNews = [
        NewsModel(
            title: "삼성전자",
            content: "반도체 매출 증가에 따른 주가 상승이 보이지 않아, 동학 개미들 이탈 가속",
            date: "20220704"
        ),
        NewsModel(
            title: "에어부산",
            content: "에어부산, 지역 항공인재 양성 나선다…지원금도 제공",
            date: "20220703"
        ),
        NewsModel(
            title: "SK하이닉스",
            content: "[특징주] 삼성전자·SK하이닉스, 신저가 찍고 4거래일만에 반등(종합)",
            date: "20220702"
        ),
        NewsModel(
            title: "하나투어",
            content: "물가 걱정에 기 못 펴는 리오프닝주…하나투어 26%↓ 모두투어 22%↓",
            date: "20220701"
        ),
        NewsModel(
            title: "미래에셋증권",
            content: "미래에셋증권, 새로운 MTS 서비스 개시",
            date: "20220630"
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return mockNews.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TestCollectionViewCell.identifier,
            for: indexPath
        ) as? TestCollectionViewCell else {
            return UICollectionViewCell()
        }
        let news = mockNews[indexPath.row % mockNews.count]

        cell.setupCell(news: news)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, InfiniteCollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: UIScreen.main.bounds.width - 32,
            height: 120.0
        )
    }
}

private extension ViewController {
    func setupViews() {
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(120.0)
        }
    }
}

