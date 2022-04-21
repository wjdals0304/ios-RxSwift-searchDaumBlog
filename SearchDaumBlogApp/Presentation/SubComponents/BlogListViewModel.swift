//
//  BlogListViewModel.swift
//  SearchDaumBlogApp
//
//  Created by 김정민 on 2022/04/21.
//

import RxSwift
import RxCocoa

struct BlogListViewModel {
    
    let filterViewModel = FilterViewModel()
    
    let blogListCellData = PublishSubject<[BlogListCellData]>()
    let cellData: Driver<[BlogListCellData]>
    
    init() {
        self.cellData = blogListCellData
            .asDriver(onErrorJustReturn: [])
    }
    
    
    
    
    
    
}
