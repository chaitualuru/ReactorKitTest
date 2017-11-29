//
//  ViewController.swift
//  TestProject
//
//  Created by Krishna C Aluru on 11/29/17.
//  Copyright © 2017 Krishna C Aluru. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxDataSources

class TestViewController: UIViewController, View {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 100, height: 50)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(cellType: TestCollectionViewCell.self)
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var disposeBag: DisposeBag = DisposeBag()
    lazy var dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, String>>(
        configureCell: configureCell,
        configureSupplementaryView: configureSupplimentaryView
    )
    
    init(reactor: TestReactor) {
        defer { self.reactor = reactor }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: TestReactor) {
        Observable.just([SectionModel(model: "", items: ["a", "b", "c"])])
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//swiftlint:disable function_parameter_count
extension TestViewController {
    func configureCell(dataSource: CollectionViewSectionedDataSource<SectionModel<String, String>>, collectionView: UICollectionView, indexPath: IndexPath, name: String) -> UICollectionViewCell {
        let cell: TestCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: name)
        return cell
    }
    
    func configureSupplimentaryView(dataSource: CollectionViewSectionedDataSource<SectionModel<String, String>>, collectionView: UICollectionView, header: String, indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
}
//swiftlint:enable function_parameter_count

